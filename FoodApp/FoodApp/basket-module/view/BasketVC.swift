//
//  BasketVC.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import UIKit

class BasketVC: UIViewController {

    var basketList = [Basket]()
    var basketPresenterObject:ViewToPresenterBasketProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BasketRouter.createModule(ref: self)
    }
    
}

extension BasketVC : PresenterToViewBasketProtocol {
    func sendDataView(basketList: Array<Basket>) {
        self.basketList = basketList
        DispatchQueue.main.async {
            // self.kisilerTableView.reloadData()
        }
    }
}
