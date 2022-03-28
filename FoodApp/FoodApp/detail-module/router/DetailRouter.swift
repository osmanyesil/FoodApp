//
//  DetailRouter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class DetailRouter : PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailVC) {
        ref.detailPresenterObject = DetailPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailInteractor()
        
    }
    
    
}
