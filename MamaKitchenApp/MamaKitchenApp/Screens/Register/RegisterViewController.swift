//
//  RegisterViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 26/09/2022.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var backgroundIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lastNameTextField: CustomTextField!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var lastNameStackView: UIStackView!
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var firstNameStackView: UIStackView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameStackView: UIStackView!
    
    @IBOutlet weak var restaurantTextFieldd: CustomTextField!
    @IBOutlet weak var restaurantLbl: UILabel!
    @IBOutlet weak var restaurantNameStackView: UIStackView!
    @IBOutlet weak var restaurantNameView: UIView!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var adressTextField: CustomTextField!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var adressStackView: UIStackView!
    @IBOutlet weak var adressView: UIView!
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        let tap  =  UITapGestureRecognizer(target: self, action: #selector(loginLblDidTapped(_:)))
        loginLabel.addTagGesture(tap)
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        nameView.customizeViewForContainTextField()
        lastNameView.customizeViewForContainTextField()
        restaurantNameView.customizeViewForContainTextField()
        passwordView.customizeViewForContainTextField()
        phoneView.customizeViewForContainTextField()
        emailView.customizeViewForContainTextField()
        adressView.customizeViewForContainTextField()
        nameTextField.setuptextField(delegate: self, type: .emailAddress)
        lastNameTextField.setuptextField(delegate: self, type: .emailAddress)
        restaurantTextFieldd.setuptextField(delegate: self, type: .emailAddress)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setuptextField(delegate: self, type: .default)
        phoneTextField.setuptextField(delegate: self, type: .emailAddress)
        emailTextField.setuptextField(delegate: self, type: .emailAddress)
        passwordTextField.enablePasswordToggle()
        emailLbl.textColor = .macaroonYellow
        passwordLbl.textColor = .macaroonYellow
        restaurantLbl.textColor = .macaroonYellow
        nameLbl.textColor = .macaroonYellow
        lastNameLbl.textColor = .macaroonYellow
        phoneLbl.textColor = .macaroonYellow
        adressLbl.textColor = .macaroonYellow
        registerBtn.setupButton()
        profileImage.layer.cornerRadius = profileImage.frame.height *  0.5
        profileImage.layer.borderColor  = UIColor.kelleyGreen.cgColor
        profileImage.layer.borderWidth  = 2
        loginLabel.textColor = .kelleyGreen
        loginLabel.applyLineView(lineColor: .kelleyGreen)
        let image = UIImage(named: "back_arrow")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor.kelleyGreen
    }
    
    @objc func loginLblDidTapped(_ sender: UITapGestureRecognizer? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


extension RegisterViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
