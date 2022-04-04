//
//  DetailRouter.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation

class DetailRouter : PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailVC) {
        let presenter = DetailPresenter()
        
        ref.detailPresenterObject = presenter
        ref.detailPresenterObject?.detailInteractor = DetailInteractor()
        ref.detailPresenterObject?.detailView = ref
        ref.detailPresenterObject?.detailInteractor?.detailPresenter = presenter
        
    }
    
    
}
