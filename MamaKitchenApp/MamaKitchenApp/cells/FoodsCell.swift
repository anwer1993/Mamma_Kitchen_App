//
//  FoodsCell.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 11/10/2022.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var timerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.foodImage.layer.cornerRadius =  10
        self.foodImage.layer.borderColor  =  UIColor.kelleyGreen.cgColor
        self.foodImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configCell(foodModel: FoodDatum? = nil) {
        foodName.text = "Food name"
        descriptionLbl.text = "nw_resolver_start_query_timer_block_invoke [C1] Query fired: did not receive all answers in time for echo.sa:443"
        priceLbl.text = "30.00" +  " EUR"
        timeLbl.text = "40 min"
        timerImage.image = UIImage(systemName: "timer")
    }
}
