//
//  UIImageViewExtension.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 26/09/2022.
//

import Foundation
import  UIKit


extension UIImageView {
    
    func setTintColor(to color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
