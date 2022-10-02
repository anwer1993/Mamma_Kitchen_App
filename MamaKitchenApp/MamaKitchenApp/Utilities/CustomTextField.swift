//
//  CustomTextField.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 24/09/2022.
//

import Foundation
import UIKit


class CustomTextField : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        self.textChanged(textField.text!)
    }
    
}
