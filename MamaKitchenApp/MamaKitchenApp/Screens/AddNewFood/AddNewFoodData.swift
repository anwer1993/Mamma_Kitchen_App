//
//  AddNewFoodData.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 12/10/2022.
//

import Foundation

extension AddNewFoodViewController {
    
    func getFoodCat() {
        showOrHideLoader(done: false)
        FoodService.shared.getFoodCat {[weak self]response in
            guard let StrongSelf = self else {return}
            StrongSelf.showOrHideLoader(done: true)
            if let success = response?.result, let date = response?.data, success == true {
                StrongSelf.catList = date
                StrongSelf.configCategoryTextField()
            } else if let message = response?.message {
                StrongSelf.showAlert(for: message)
            }
        }
    }
    
}
