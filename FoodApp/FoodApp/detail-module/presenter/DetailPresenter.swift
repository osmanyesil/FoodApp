//
//  DetailPresenter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func foodBasket(model:BasketModel) {
        detailInteractor?.addFoodBasket(model: model)
    }
    
    
}
