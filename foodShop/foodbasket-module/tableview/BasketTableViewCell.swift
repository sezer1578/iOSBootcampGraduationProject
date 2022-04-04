//
//  BasketTableViewCell.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var basketFoodOrderedLabel: UILabel!
    @IBOutlet weak var basketFoodPriceLabel: UILabel!
    @IBOutlet weak var basketFoodNameLabel: UILabel!
    @IBOutlet weak var basketFoodImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
