//
//  DetailProtocols.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

protocol ViewToPresenterDetailProtocol{
    var detailInteractor:PresenterToInteractorDetailProtocol? { get set }
    
    func foodBasket(model:BasketModel)
}

protocol PresenterToInteractorDetailProtocol{
    func addFoodBasket(model:BasketModel)
}

protocol PresenterToRouterDetailProtocol{
    static func createModule(ref: DetailVC)
}
