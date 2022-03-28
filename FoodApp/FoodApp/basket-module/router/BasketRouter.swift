//
//  BasketRouter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class BasketRouter : PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketVC) {
        let presenter = BasketPresenter()
        
        ref.basketPresenterObject = presenter
        ref.basketPresenterObject?.basketInteractor = BasketInteractor()
        ref.basketPresenterObject?.basketView = ref
        ref.basketPresenterObject?.basketInteractor?.basketPresenter = presenter
    }
    
    
}
