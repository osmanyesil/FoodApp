//
//  FoodItemTableViewCell.swift
//  FoodApp
//
//  Created by osmanyesil on 4/2/22.
//

import UIKit
import Kingfisher

class FoodItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var previewImageView: UIImageView!
    static let rowHeight:CGFloat = 120
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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


