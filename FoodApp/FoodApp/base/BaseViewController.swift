//
//  BaseViewController.swift
//  FoodApp
//
//  Created by osmanyesil on 4/4/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
        let appearance = UINavigationBarAppearance()
        self.navigationController?.navigationBar.isTranslucent = true
        
        appearance.backgroundColor = UIColor(red: 112/255, green: 13/255, blue: 193/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                          .font: UIFont(name: "Avenir-Heavy", size: 21)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
