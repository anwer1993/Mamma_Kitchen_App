//
//  UITextFieldExtension.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 24/09/2022.
//

import Foundation
import UIKit

extension UITextField {
    
    func SecureTextField(delegate: UITextFieldDelegate) {
        self.delegate = delegate
        self.isSecureTextEntry = true
        self.enablePasswordToggle()
    }
    
    func isEmpty() -> Bool {
        return (text == nil || text == "" || text == " ")
    }
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        let image = isSecureTextEntry ? UIImage(named: "Icon feather-eye-off")!.withRenderingMode(.alwaysTemplate) : UIImage(named: "Icon feather-eye")!.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .macaroonYellow
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: -5, left: -16, bottom: 0, right: -5)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 20), y: CGFloat(10), width: CGFloat(20), height: CGFloat(20))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setuptextField(delegate: UITextFieldDelegate, type: UIKeyboardType) {
        self.delegate = delegate
        self.keyboardType = type
    }
    
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}


extension UITextView {
    func validatedTextView(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
