//
//  RegisterViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 26/09/2022.
//

import UIKit
import Kingfisher
import MapKit
import CoreLocation

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
    
    
    var source: SourceEnum = .none
    var profile: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        let tap  =  UITapGestureRecognizer(target: self, action: #selector(loginLblDidTapped(_:)))
        loginLabel.addTagGesture(tap)
        if source == .fromSettings{
            updateUIWithData(profile: AccountManager.sharedInstance.profile)
            self.profile =  AccountManager.sharedInstance.profile
            loginLabel.isHidden = true
        }
        adressTextField.addTarget(self, action: #selector(selectLocation), for: .touchDown)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if source == .fromSettings {
            getProfile()
        }
    }
    
    @objc func selectLocation() {
        let locationManager = CLLocationManager()
        // Ask for Authorisation from the User.
        locationManager.requestAlwaysAuthorization()
        // For use in foreground
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            Router.shared.present(screen: .SelectLocation(delegate: self), modalePresentatioinStyle: .fullScreen, completion: nil)
        } else {
            showAlert(for: "You should enable service location in your device")
        }
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
        adressTextField.delegate  = self
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
    
    func updateUIWithData(profile: ProfileModel?) {
        if let profile = profile {
            nameTextField.text = profile.firstName
            lastNameTextField.text = profile.lastName
            restaurantTextFieldd.text = profile.restaurantName
            passwordTextField.text = AccountManager.sharedInstance.password
            phoneTextField.text = profile.phone
            emailTextField.text = profile.email
            adressTextField.text = profile.address
            registerBtn.setTitle("Confirm", for: .normal)
            if  let picture = profile.picture {
                let url = URL(string: "\(Tools.BASE_URL)\(picture)")
                profileImage.kf.setImage(with: url)
                profileImage.contentMode = .scaleAspectFill
            }
        }
    }
    
    @objc func loginLblDidTapped(_ sender: UITapGestureRecognizer? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        if source ==  .fromSettings {
            do {
                let name = try nameTextField.validatedText(validationType: .name)
                let lastNamee = try lastNameTextField.validatedText(validationType: .name)
                let  restaurantName = try restaurantTextFieldd.validatedText(validationType: .name)
                _ = try passwordTextField.validatedText(validationType: .name)
                let phone = try phoneTextField.validatedText(validationType: .name)
                let email = try emailTextField.validatedText(validationType: .email)
                let address = try adressTextField.validatedText(validationType: .name)
                let editedProfile = ProfileModel(id: self.profile?.id, firstName: name, lastName: lastNamee, phone: phone, restaurantName: restaurantName, picture: nil, code: profile?.code, deviceToken: profile?.deviceToken, email: email, address: address, longitude: profile?.longitude, latitude: profile?.latitude, emailVerifiedAt: nil, idNumber: profile?.idNumber, idPicture: nil, bank: nil, iban: nil, isPhoneVerified: nil, isApproved: nil, isActive: nil, isBanned: nil, isNotifiable: nil, userType: nil, createdAt: nil, updatedAt: nil)
                updateProfile(profile: editedProfile)
            } catch (let error) {
                showAlert(for: (error as! ValidationError).message)
            }
        } else {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        if source == .fromSettings {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
        
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == adressTextField {
                return false
        }
        return true
    }
    
}


extension RegisterViewController: UpdateLocationDelegate {
    
    func updateLocation(latitude: Double, longitude: Double, address: String) {
        self.profile?.latitude = "\(latitude)"
        self.profile?.longitude = "\(longitude)"
        self.profile?.address = address
        self.adressTextField.text = address
        print(self.profile?.latitude)
        print(self.profile?.longitude)
        print(self.profile?.address)
    }
    
}
