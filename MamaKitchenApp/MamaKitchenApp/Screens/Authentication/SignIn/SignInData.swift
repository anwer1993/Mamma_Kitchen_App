//
//  SignInData.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation
import UIKit

extension SignInViewController {
    
    func login(_ email: String, _ password: String) {
        self.showOrHideLoader(done: false)
        AuthenticationService.sharedInstance.login(email: email, password: password) {[weak self] resp in
            guard  let this = self  else {return}
            this.showOrHideLoader(done: true)
            if let data = resp, data.result == true {
                if let code = data.code {
                    print("success", code)
                    DispatchQueue.main.async {
                        AccountManager.sharedInstance.email = email
                        AccountManager.sharedInstance.password = password
                        Router.shared.push(with: this.navigationController, screen: .Verification, animated: true)
                    }
                    // pass to verification screen
                } else {
                    this.showAlert(for: ErrorMessage.INVALID_CREDENTIALS.message)
                }
            } else {
                this.showAlert(for: ErrorMessage.INVALID_CREDENTIALS.message)
            }
        }
    }
    
}
