//
//  BasketItemTableViewCell.swift
//  FoodApp
//
//  Created by osmanyesil on 4/2/22.
//

import UIKit

class BasketItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func increaseButtonAction(_ sender: Any) {
    }
    
    @IBAction func decreaseButtonAction(_ sender: Any) {
    }
    
    func setupUI(model: BasketModel){
        nameLabel.text = model.name
        priceLabel.text = "₺\(model.price ?? "0")"
        countLabel.text = model.foodOrderCount
        
    }
}


