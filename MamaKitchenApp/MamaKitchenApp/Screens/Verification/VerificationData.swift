//
//  VerificationData.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation


extension VerificationViewController {
    
    func verifyAccount() {
        self.showOrHideLoader(done: false)
        AuthenticationService.sharedInstance.verifyAccount(email: email, password: password, otp: otpCode) { [weak self] resp in
            guard let this = self else {return}
            this.showOrHideLoader(done: true)
            if let data = resp, data.result == true {
                if let token = data.token {
                    AccountManager.sharedInstance.token = token
                    AccountManager.sharedInstance.email = this.email
                    AccountManager.sharedInstance.password = this.password
                    DispatchQueue.main.async {
                        Router.updateRootVC()
                        //  login to the app
//                        Router.shared.push(with: this.navigationController, screen: .Verification, animated: true)
                    }
                } else {
                    this.showAlert(for: ErrorMessage.INVALID_OTP.message)
                }
            } else {
                this.showAlert(for: ErrorMessage.INVALID_OTP.message)
            }
        }
    }
}
