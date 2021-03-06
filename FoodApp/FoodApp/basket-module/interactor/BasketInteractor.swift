//
//  BasketInteractor.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation
import Alamofire

class BasketInteractor : PresenterToInteractorBasketProtocol {
    
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func getFoodBasket(user_name: String) {
        let params:Parameters = ["kullanici_adi":user_name]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters:params).response{ response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(BasketResponse.self, from: data)
                    if let responseList = response.basketFoods {
                        self.basketPresenter?.sendDataPresenter(basketList: responseList)
                    }
                }catch{
                    self.basketPresenter?.sendDataPresenter(basketList: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteFoodInBasket(basket_food_id: String, user_name: String) {
        let params:Parameters = ["sepet_yemek_id":basket_food_id,"kullanici_adi":user_name]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.getFoodBasket(user_name: user_name)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
}
