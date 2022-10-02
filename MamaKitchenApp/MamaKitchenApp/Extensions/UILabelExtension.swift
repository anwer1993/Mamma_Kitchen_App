//
//  UILabelExtension.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 24/09/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func applyLineView(lineColor: UIColor) {
        let frame = CGRect(x: 0, y: self.bounds.size.height, width: self.bounds.size.width, height: 1)
        let lineView = UIView(frame: frame)
        lineView.backgroundColor = lineColor
        self.addSubview(lineView)
    }

}
