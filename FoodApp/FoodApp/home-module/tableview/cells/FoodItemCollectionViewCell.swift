//
//  FoodItemCollectionViewCell.swift
//  FoodApp
//
//  Created by osmanyesil on 4/3/22.
//

import UIKit
import Kingfisher

class FoodItemCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var previewImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupUI(model: FoodModel){
        nameLabel.text = model.name
        priceLabel.text = "₺\(model.price ?? "0")"
        let replacedName = model.name?.replaceTurkishCharacter() ?? ""
        if let name = model.name, let imageURL = URL(string:  "http://kasimadalan.pe.hu/yemekler/resimler/\(replacedName).png"){
            let resource = ImageResource(downloadURL: imageURL, cacheKey: name)
            previewImageView.kf.setImage(with: resource)
        }
    }
}
