//
//  UIViewExtension.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 24/09/2022.
//

import Foundation
import UIKit

extension UIView  {
    
    func addTagGesture(_ tap:UITapGestureRecognizer) {
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
    func applySketchShadow(color: UIColor , alpha: Float, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = alpha
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur / 2.0
        if spread == 0 {
            self.layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func customizeViewForContainTextField() {
        self.layer.cornerRadius = 5
        self.applySketchShadow(color: UIColor.black5, alpha: 1, x: 0, y: 5, blur: 20, spread: 0)
    }
    
}
