//
//  UIButtonExtension.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 24/09/2022.
//

import Foundation
import UIKit

extension UIButton {
    
    func  setupButton(){
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor.macaroonYellow.cgColor
        self.applySketchShadow(color: UIColor.macaroonYellow37, alpha: 1, x: 0, y: 5, blur: 20, spread: 0)
    }
    
    func setTintColor(image:  UIImage, withcolor: UIColor) {
        let image = image.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: .normal)
        self.tintColor = withcolor
    }
    
}
