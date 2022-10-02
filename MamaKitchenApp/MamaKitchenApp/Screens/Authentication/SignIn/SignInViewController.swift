//
//  SignInViewController.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 13/09/2022.
//

import Foundation
import UIKit

class SignInViewController: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var backgroundIcon: UIImageView!
    @IBOutlet weak var appInsideLogo: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var passwordStaticLabel: UILabel!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var emailStaticLabel: UILabel!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        addTapGesture()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = AccountManager.sharedInstance.email ?? ""
        passwordTextField.text = AccountManager.sharedInstance.password ??  ""
    }
    
    func initView() {
        emailView.customizeViewForContainTextField()
        passwordView.customizeViewForContainTextField()
        emailTextField.setuptextField(delegate: self, type: .emailAddress)
        passwordTextField.setuptextField(delegate: self, type: .default)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.enablePasswordToggle()
        forgotPasswordLabel.textColor = .macaroonYellow
        forgotPasswordLabel.applyLineView(lineColor: .macaroonYellow)
        signUpLabel.textColor = .kelleyGreen
        signUpLabel.applyLineView(lineColor: .kelleyGreen)
        signInButton.setupButton()
    }
    
    func addTapGesture()  {
        let forgotPasswordTap = UITapGestureRecognizer(target: self, action: #selector(showForgotPasswordScreen(_:)))
        forgotPasswordLabel.addTagGesture(forgotPasswordTap)
        let registerTap = UITapGestureRecognizer(target: self, action: #selector(showRegistrationScreen(_:)))
        signUpLabel.addTagGesture(registerTap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//
//            if self.identityStack.frame.origin.y + self.identityStack.frame.height > keyboardSize.origin.y {
//                print("passwordTextField hidden")
//                descStackTopConstrainte.constant = 15
//                identityStackTopContrainte.constant = 15
//            }
//        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
//        descStackTopConstrainte.constant = descStackTopConstrainteOriginal
//        identityStackTopContrainte.constant = identityStackTopContrainteOriginal
    }
    
    @objc func showForgotPasswordScreen(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.push(with: self.navigationController, screen: .ForgotPassword, animated: true)
    }
    
    @objc func showRegistrationScreen(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.push(with: self.navigationController, screen: .Register(source: SourceEnum.none), animated: true)
    }
    
    @IBAction func signInBtnDidTapped(_ sender: Any) {
        do {
            let email = try emailTextField.validatedText(validationType: .email)
            let password = passwordTextField.text ?? ""
            login(email, password)
        } catch (let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    
    func resetTitleLabl(_ textField: UITextField) {
        if textField == emailTextField {
            emailStaticLabel.textColor = .black
        } else {
            passwordStaticLabel.textColor = .black
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resetTitleLabl(textField)
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resetTitleLabl(textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailStaticLabel.textColor = .macaroonYellow
        } else {
            passwordStaticLabel.textColor = .macaroonYellow
        }
    }
    
}
