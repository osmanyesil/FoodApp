//
//  HomeRouter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class HomeRouter : PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeVC) {
        let presenter = HomePresenter()
        
        //View
        ref.homePresenterObject = presenter
        //Presenter
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        //Interactor
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
