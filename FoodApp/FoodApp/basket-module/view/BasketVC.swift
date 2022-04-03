//
//  BasketVC.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import UIKit

class BasketVC: UIViewController {

    var basketList = [BasketModel]()
    var basketPresenterObject:ViewToPresenterBasketProtocol?
    let username = "osmanyesil"
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        BasketRouter.createModule(ref: self)
        basketPresenterObject?.basketInteractor?.getFoodBasket(user_name: username)
        
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: "BasketItemTableViewCell", bundle: nil), forCellReuseIdentifier: "BasketItemTableViewCell")
    }
    
}

extension BasketVC : PresenterToViewBasketProtocol {
    func sendDataView(basketList: Array<BasketModel>) {
        self.basketList = basketList
        DispatchQueue.main.async {
             self.tableView.reloadData()
        }
    }
}


extension BasketVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemTableViewCell", for: indexPath) as! BasketItemTableViewCell
        cell.setupUI(model: basketList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FoodItemTableViewCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let food = self.basketList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.name!) yemek silinsin mi ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.basketPresenterObject?.delFoodInBasket(basket_food_id: food.id!, user_name: self.username)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
        
    }
}
