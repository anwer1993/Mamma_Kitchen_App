//
//  RegisterData.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 26/09/2022.
//

import Foundation


extension  RegisterViewController  {
    
    func getProfile() {
        if let token =  AccountManager.sharedInstance.token {
            showOrHideLoader(done: false)
            ProfileService.sharedInstance.getProfile(token: token) {[weak self] response in
                guard let this = self else {return}
                this.showOrHideLoader(done: true)
                if let response = response {
                    if response.result == true, let data = response.data {
                        this.profile = data
                        AccountManager.sharedInstance.profile = data
                        this.updateUIWithData(profile: data)
                    } else if let message = response.message {
                        this.showAlert(for: message )
                    } else {
                        this.showAlert(for: ErrorMessage.SESSION_EXPIRED.message)
                    }
                } else {
                    this.showAlert(for: ErrorMessage.SESSION_EXPIRED.message)
                }
            }
        }
    }
    
    func updateProfile(profile: ProfileModel) {
        if let token = AccountManager.sharedInstance.token {
            showOrHideLoader(done: false)
            ProfileService.sharedInstance.updateProfile(profile: profile, token: token) { [weak self] response in
                guard let this = self else {return}
                this.showOrHideLoader(done: true)
                if let response = response {
                    if response.result == true, let data = response.data {
                        this.showAlertWithOk(withTitle: "Success", withMessage: "You have successfully updated your profile") {
                            this.profile = data
                            AccountManager.sharedInstance.profile = data
                            this.updateUIWithData(profile: data)
                        }
                    } else if let message = response.message {
                        this.showAlert(for: message)
                    } else {
                        this.showAlert(for: ErrorMessage.SESSION_EXPIRED.message)
                    }
                } else {
                    this.showAlert(for: ErrorMessage.SESSION_EXPIRED.message)
                }
            }
        }
    }
    
}
