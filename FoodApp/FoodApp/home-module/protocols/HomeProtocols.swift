//
//  HomeProtocols.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

protocol ViewToPresenterHomeProtocol{
    var homeInteractor:PresenterToInteractorHomeProtocol? { get set }
    var homeView:PresenterToViewHomeProtocol? { get set }
    
    func getFoods()
}

protocol PresenterToInteractorHomeProtocol{
    var homePresenter:InteractorToPresenterHomeProtocol? { get set }
    
    func getAllFoods()
}

protocol InteractorToPresenterHomeProtocol{
    func sendDataPresenter(foodList:Array<Foods>)
}

protocol PresenterToViewHomeProtocol {
    func sendDataView(foodList:Array<Foods>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:HomeVC)
}
