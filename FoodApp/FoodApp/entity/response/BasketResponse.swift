//
//  BasketResponse.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

struct BasketResponse : Decodable {
    var basketFoods:[BasketModel]?
    var success:Int?
    
    private enum CodingKeys: String, CodingKey {
        case basketFoods = "sepet_yemekler"
    }
}
