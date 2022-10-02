//
//  VerificationViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 25/09/2022.
//

import UIKit
import OTPFieldView
import AudioToolbox

class VerificationViewController: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var backgroundIcon: UIImageView!
    @IBOutlet weak var smsIcon: UIImageView!
    @IBOutlet weak var verifyAccountLbl: UILabel!
    @IBOutlet weak var resendCodeLbl: UILabel!
    @IBOutlet weak var verifyAccountBtn: UIButton!
    @IBOutlet weak var otpFieldView: OTPFieldView!
    
    var otpCode: String = ""
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        resendCodeLbl.textColor = .macaroonYellow
        verifyAccountBtn.setupButton()
        self.otpFieldView.layer.backgroundColor = UIColor.clear.cgColor
        self.otpFieldView.fieldsCount = 4
        self.otpFieldView.defaultBorderColor = .white
        self.otpFieldView.defaultBackgroundColor = .white
        self.otpFieldView.filledBackgroundColor = .white
        self.otpFieldView.fieldBorderWidth = 1
        self.otpFieldView.filledBorderColor = UIColor.white
        self.otpFieldView.cursorColor = UIColor.macaroonYellow
        self.otpFieldView.displayType = .roundedCorner
        self.otpFieldView.fieldSize = 40
        self.otpFieldView.separatorSpace = 20
        self.otpFieldView.shouldAllowIntermediateEditing = false
        self.otpFieldView.delegate = self
        self.otpFieldView.initializeUI()
    }
    
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        verifyAccount()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension VerificationViewController: OTPFieldViewDelegate {
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print(otp)
        otpCode = otp
        email = AccountManager.sharedInstance.email ?? ""
        password = AccountManager.sharedInstance.password ?? ""
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return true
    }
    
    
}
