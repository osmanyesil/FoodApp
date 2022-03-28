//
//  HomeInteractor2.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import Foundation
import Alamofire

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var homePresenter : InteractorToPresenterHomeProtocol?
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{ response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let responseList = response.foods {
                        self.homePresenter?.sendDataPresenter(foodList: responseList)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
