//
//  BasketPresenter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class BasketPresenter : ViewToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func foodBasket(user_name: String) {
        basketInteractor?.getFoodBasket(user_name: user_name)
    }
    
    func delFoodInBasket(basket_food_id: String, user_name: String) {
        basketInteractor?.deleteFoodInBasket(basket_food_id: basket_food_id, user_name: user_name)
    }
}

extension BasketPresenter : InteractorToPresenterBasketProtocol {
    func sendDataPresenter(basketList: Array<Basket>) {
        basketView?.sendDataView(basketList: basketList)
    }
}
