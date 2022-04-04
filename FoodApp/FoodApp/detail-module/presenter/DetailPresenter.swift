//
//  DetailPresenter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    var detailView: PresenterToViewDetailProtocol? 
    
    func foodBasket(model:BasketModel) {
        detailInteractor?.addFoodBasket(model: model)
    }
}

extension DetailPresenter : InteractorToPresenterDetailProtocol {
    func sendDataPresenter(_ succcess:Bool) {
        detailView?.sendDataView(succcess)
    }
}
