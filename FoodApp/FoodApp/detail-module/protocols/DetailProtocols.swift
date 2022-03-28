//
//  DetailProtocols.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

protocol ViewToPresenterDetailProtocol{
    var detailInteractor:PresenterToInteractorDetailProtocol? { get set }
    
    func foodImage(name:String)
    func foodBasket(food_name:String,food_imageName:String,food_price:String,food_order_count:String,user_name:String)
}

protocol PresenterToInteractorDetailProtocol{
    func getFoodImage(name:String)
    func addFoodBasket(food_name:String,food_imageName:String,food_price:String,food_order_count:String,user_name:String)
}

protocol PresenterToRouterDetailProtocol{
    static func createModule(ref: DetailVC)
}
