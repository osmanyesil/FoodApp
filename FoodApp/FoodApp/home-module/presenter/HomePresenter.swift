//
//  HomePresenter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func getFoods() {
        homeInteractor?.getAllFoods()
    }
}

extension HomePresenter : InteractorToPresenterHomeProtocol {
    func sendDataPresenter(foodList: Array<Foods>) {
        homeView?.sendDataView(foodList: foodList)
    }
}
