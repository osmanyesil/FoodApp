//
//  ViewController.swift
//  FoodApp
//
//  Created by osmanyesil on 3/23/22.
//

import UIKit

class HomeVC: UIViewController {

    var foodList = [Foods]()
    var homePresenterObject:ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRouter.createModule(ref: self)

        homePresenterObject?.getFoods() // Yemekleri listele
    }
}

extension HomeVC : PresenterToViewHomeProtocol {
    func sendDataView(foodList: Array<Foods>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            //self.kisilerTableView.reloadData()
        }
    }
}
