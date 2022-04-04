//
//  DetailInteractor.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation
import Alamofire

class DetailInteractor : PresenterToInteractorDetailProtocol {
    
    var detailPresenter: InteractorToPresenterDetailProtocol?

    func addFoodBasket(model:BasketModel) {
        
        self.getFoodBasket { basketList in
            var foodOrderCount = Int(model.foodOrderCount ?? "0") ?? 0
            if let responseList = basketList{
                for item in responseList{
                    if item.name == model.name{
                        foodOrderCount += Int(item.foodOrderCount ?? "0") ?? 0
                        self.deleteFoodInBasket(basket_food_id: item.id!)
                        break
                    }
                }
            }
            self.addFoodBasket(model: model, foodOrderCount: foodOrderCount) { success in
                if success {
                    self.detailPresenter?.sendDataPresenter(true)
                }
            }
        }
    }
    
    func getFoodBasket(completionBlock: @escaping ([BasketModel]?) -> Void) {
        let params:Parameters = ["kullanici_adi":UserManager.shared.userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters:params).response{ response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(BasketResponse.self, from: data)
                    completionBlock(response.basketFoods)
                }catch{
                    print(error.localizedDescription)
                    completionBlock(nil)
                }
            }
        }
    }
    
    func deleteFoodInBasket(basket_food_id: String) {
        let params:Parameters = ["sepet_yemek_id":basket_food_id,"kullanici_adi":UserManager.shared.userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func addFoodBasket(model:BasketModel,foodOrderCount:Int, completionBlock: @escaping (Bool) -> Void){
        let params:Parameters = ["yemek_adi":model.name ?? "",
                                 "yemek_resim_adi":model.imageName ?? "",
                                 "yemek_fiyat":Int(model.price ?? "0") ?? 0,
                                 "yemek_siparis_adet":foodOrderCount,
                                 "kullanici_adi":UserManager.shared.userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        completionBlock(true)
                    }
                }catch{
                    completionBlock(false)
                    print(error.localizedDescription)
                }
            }
        }
    }
}

