//
//  DetailPresenter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
  
    func foodImage(name: String) {
        detailInteractor?.getFoodImage(name: name)
    }
    
    func foodBasket(food_name: String, food_imageName: String, food_price: String, food_order_count: String, user_name: String) {
        detailInteractor?.addFoodBasket(food_name: food_name, food_imageName: food_imageName, food_price: food_price, food_order_count: food_order_count, user_name: user_name)
    }
    
    
}
