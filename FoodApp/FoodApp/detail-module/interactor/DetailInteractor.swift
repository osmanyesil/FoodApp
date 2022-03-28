//
//  DetailInteractor.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation
import Alamofire

class DetailInteractor : PresenterToInteractorDetailProtocol {
    func getFoodImage(name: String) {
        //TODO: Kingfisher ile resim çekilecek.
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(name)"){
            //imageView.kf.SetImage(with:url) //kf dediğimizde KingFisher cache e atıyoruz
        }
    }
    
    func addFoodBasket(food_name: String, food_imageName: String, food_price: String, food_order_count: String, user_name: String) {
        let params:Parameters = ["yemek_adi":food_name,"yemek_resim_adi":food_imageName,"yemek_fiyat":food_price,"yemek_siparis_adet":food_order_count,"kullanici_adi":user_name]
        
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

