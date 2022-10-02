//
//  ContactUsViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 02/10/2022.
//

import UIKit

class ContactUsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var backgroundIcon: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var contactUsIcon: UIImageView!
    @IBOutlet weak var contactUsLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var stackViewContainer: UIStackView!
    @IBOutlet weak var messageStackView: UIStackView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var emailLineView: UIView!
    @IBOutlet weak var nameLineView: UIView!
    @IBOutlet weak var contactUsHeight: NSLayoutConstraint!
    @IBOutlet weak var contactUsLblVerticalposition: NSLayoutConstraint!
    
    var contactUsLblVerticalpositionOriginal: CGFloat  = 0.0
    var contactUsLblHeightOriginal: CGFloat  = 0.0
    var activeTextField: UITextField? = nil
    var activeTextView: UITextView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        addkeyboardNotifObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contactUsLblVerticalpositionOriginal = contactUsLblVerticalposition.constant
        contactUsLblHeightOriginal = contactUsHeight.constant
    }
    
    func addkeyboardNotifObserver()  {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func initView() {
        backButton.setTintColor(image: UIImage(named: "back-icon")!, withcolor: .white)
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        titleLbl.textColor = .white
        titleLbl.text = "About us"
        messageView.layer.cornerRadius = 15
        messageView.applySketchShadow(color: .black16, alpha: 1, x: 0, y: 5, blur: 10, spread: 0)
        initializeTextField(label: nameLbl, lineView: nameLineView)
        initializeTextField(label: emailLbl, lineView: emailLineView)
        nameTextField.setuptextField(delegate: self, type: .default)
        emailTextField.setuptextField(delegate: self, type: .emailAddress)
        messageTextView.delegate  = self
        initializeTextView()
        messageTextView.layer.borderWidth = 1
        messageTextView.layer.cornerRadius = 8
        sendBtn.setupButton()
    }
    
    func initializeTextField(label: UILabel, lineView: UIView) {
        label.textColor = .dark
        lineView.layer.backgroundColor = UIColor.gray.cgColor
    }
    
    func activateTextField(label: UILabel, lineView: UIView) {
        label.textColor = .macaroonYellow
        lineView.layer.backgroundColor = UIColor.macaroonYellow.cgColor
    }
    
    func initializeTextView() {
        messageLbl.textColor = .dark
        messageTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func activateTextView() {
        messageLbl.textColor = .macaroonYellow
        messageTextView.layer.borderColor = UIColor.macaroonYellow.cgColor
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if let activeTextView = activeTextView {
                if self.messageView.frame.origin.y + (self.messageView.frame.height - 100) > keyboardSize.origin.y {
                    print("passwordTextField hidden")
                    contactUsLblVerticalposition.constant  =  -120
                    contactUsHeight.constant  = 0
                }
            } else if let activeTextField = activeTextField {
                if activeTextField ==  nameTextField {
                    if self.messageView.frame.origin.y + (self.messageView.frame.height / 3) > keyboardSize.origin.y {
                        print("passwordTextField hidden")
                        contactUsLblVerticalposition.constant  =  -100
                        contactUsHeight.constant  = 0
                    }
                } else {
                    if self.messageView.frame.origin.y + (self.messageView.frame.height / 3) > keyboardSize.origin.y {
                        print("passwordTextField hidden")
                        contactUsLblVerticalposition.constant  =  -100
                        contactUsHeight.constant  = 0
                    }
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        contactUsLblVerticalposition.constant = contactUsLblVerticalpositionOriginal
        contactUsHeight.constant  = contactUsLblHeightOriginal
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        do {
            let name  = try nameTextField.validatedText(validationType: .name)
            let email = try emailTextField.validatedText(validationType: .email)
            let message = try messageTextView.validatedTextView(validationType: .message)
            print(name, email, message)
        } catch (let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }

}

extension ContactUsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            initializeTextView()
            activeTextView = nil
            return false
        }
        activateTextView()
        activeTextView = textView
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        activeTextView = textView
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        activateTextView()
        activeTextView = textView
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        initializeTextView()
        activeTextView = nil
    }
    
}

extension  ContactUsViewController: UITextFieldDelegate {
    
    func resetTextFieldColor(textField: UITextField) {
        if textField ==  nameTextField {
            initializeTextField(label: nameLbl, lineView: nameLineView)
        } else {
            initializeTextField(label: emailLbl, lineView: emailLineView)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resetTextFieldColor(textField: textField)
        activeTextField = nil
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resetTextFieldColor(textField: textField)
        activeTextField = nil
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        resetTextFieldColor(textField: textField)
        if textField ==  nameTextField {
            activateTextField(label: nameLbl, lineView: nameLineView)
        } else {
            activateTextField(label: emailLbl, lineView: emailLineView)
        }
    }
}
