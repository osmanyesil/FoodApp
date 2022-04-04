//
//  DetailProtocols.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

protocol ViewToPresenterDetailProtocol{
    var detailInteractor:PresenterToInteractorDetailProtocol? { get set }
    var detailView:PresenterToViewDetailProtocol? {get set}
    
    func foodBasket(model:BasketModel)
}

protocol PresenterToInteractorDetailProtocol{
    var detailPresenter:InteractorToPresenterDetailProtocol?{ get set }
    
    func addFoodBasket(model:BasketModel)
}

protocol InteractorToPresenterDetailProtocol {
    func sendDataPresenter(_ success:Bool)
}

protocol PresenterToViewDetailProtocol{
    func sendDataView(_ success:Bool)
}

protocol PresenterToRouterDetailProtocol{
    static func createModule(ref: DetailVC)
}
