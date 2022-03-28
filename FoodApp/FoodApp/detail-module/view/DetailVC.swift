//
//  DetailVC.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import UIKit

class DetailVC: UIViewController {

    var detailPresenterObject:ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailRouter.createModule(ref: self)
        
        //Sepete ekleme
        detailPresenterObject?.foodBasket(food_name: "", food_imageName: "", food_price: "", food_order_count: "", user_name: "")
        //Resimleri alma
        detailPresenterObject?.foodImage(name: "")
    
        
    }
    
    
    
}
