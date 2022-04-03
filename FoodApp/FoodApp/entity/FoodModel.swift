//
//  FoodModel.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

struct FoodModel : Decodable {
    var id:String?
    var name:String?
    var imageName:String?
    var price:String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "yemek_id"
        case name = "yemek_adi"
        case imageName = "yemek_resim_adi"
        case price = "yemek_fiyat"
    }
}
