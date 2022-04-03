//
//  FoodsResponse.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

struct FoodsResponse : Decodable {
    var foods:[FoodModel]?
    var success:Bool?
    
    private enum CodingKeys: String, CodingKey {
        case foods = "yemekler"
    }
}

