//
//  DetailInteractor.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation
import Alamofire

class DetailInteractor : PresenterToInteractorDetailProtocol {

    func addFoodBasket(model:BasketModel) {
        let params:Parameters = ["yemek_adi":model.name ?? "",
                                 "yemek_resim_adi":model.imageName ?? "",
                                 "yemek_fiyat":Int(model.price ?? "0") ?? 0,
                                 "yemek_siparis_adet":Int(model.foodOrderCount ?? "0"),
                                 "kullanici_adi":model.userName ?? ""]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response{ response in
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
    
    
}

