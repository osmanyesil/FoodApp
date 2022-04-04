//
//  DetailVC.swift
//  FoodApp
//
//  Created by osmanyesil on 3/28/22.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {

    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countControlStackView: UIStackView!
    @IBOutlet private weak var basketButton: UIButton!
    
    
    var selectedFood:FoodModel!
    let username = "osmanyesil"
    
    var detailPresenterObject:ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        DetailRouter.createModule(ref: self)
    }
    
    func setupUI(){
        nameLabel.text = selectedFood.name
        priceLabel.text = "₺\(selectedFood.price ?? "0")"
        let replacedName = selectedFood.name?.replaceTurkishCharacter() ?? ""
        if let name = selectedFood.name, let imageURL = URL(string:  "http://kasimadalan.pe.hu/yemekler/resimler/\(replacedName).png"){
            let resource = ImageResource(downloadURL: imageURL, cacheKey: name)
            previewImageView.kf.setImage(with: resource)
        }
    }
    
    @IBAction func addBasketAction(_ sender: Any) {
        if let count = Int(countLabel.text ?? "0"){
            if (count <= 0)   {
                let alert = UIAlertController(title: "Hata", message: "Sepete eklenecek Ürün Adedini\n lütfen kontrol ediniz!", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default) { (UIAlertAction) in
                }
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                let basketModel = BasketModel(id: selectedFood.id ?? "",
                                              name: selectedFood.name,
                                              imageName: selectedFood.imageName,
                                              price: selectedFood.price,
                                              foodOrderCount: countLabel.text ?? "",
                                              userName: username)
                
                detailPresenterObject?.foodBasket(model:basketModel)
            }
        }
    }
    
    @IBAction func increaseButtonAction(_ sender: Any) {
        if let count = countLabel.text {
            countLabel.text = String(Int(count)! + 1)
        }
    }
    
    @IBAction func decreaseButtonAction(_ sender: Any) {
        if let count = Int(countLabel.text!) {
            if (count > 0)  {
                countLabel.text = String(count - 1)
            }
        }
    }

    func openBasketTab(){
        self.tabBarController?.selectedIndex = 1
    }
}

extension DetailVC : PresenterToViewDetailProtocol {
    func sendDataView(_ succcess:Bool) {
        if succcess {
            openBasketTab()
        }
    }
}
