//
//  BasketProtocols.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

protocol ViewToPresenterBasketProtocol {
    var basketInteractor:PresenterToInteractorBasketProtocol? { get set }
    var basketView:PresenterToViewBasketProtocol? {get set}
    
    func foodBasket(user_name:String)
    func delFoodInBasket(basket_food_id:String,user_name:String) 
}

protocol PresenterToInteractorBasketProtocol {
    var basketPresenter:InteractorToPresenterBasketProtocol?{ get set }
    
    func getFoodBasket(user_name:String)
    func deleteFoodInBasket(basket_food_id:String,user_name:String)
}

protocol InteractorToPresenterBasketProtocol {
    func sendDataPresenter(basketList:Array<BasketModel>)
}

protocol PresenterToViewBasketProtocol{
    func sendDataView(basketList:Array<BasketModel>)
}


protocol PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketVC)
}
