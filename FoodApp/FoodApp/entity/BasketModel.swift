//
//  BasketModel.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

struct BasketModel : Decodable {
    var id: String?
    var name:String?
    var imageName:String?
    var price:String?
    var foodOrderCount:String?
    var userName:String?
    

    private enum CodingKeys: String, CodingKey {
        case id = "sepet_yemek_id"
        case name = "yemek_adi"
        case imageName = "yemek_resim_adi"
        case price = "yemek_fiyat"
        case foodOrderCount = "yemek_siparis_adet"
        case userName = "kullanici_adi"
    }
}
