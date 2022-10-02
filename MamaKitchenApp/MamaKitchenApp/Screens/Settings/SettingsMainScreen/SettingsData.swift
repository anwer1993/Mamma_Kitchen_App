//
//  SettingsData.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 28/09/2022.
//

import Foundation
import UIKit

extension SettinngsViewController   {
    
    
    func logout() {
        if let token = AccountManager.sharedInstance.token {
            showOrHideLoader(done: false)
            AuthenticationService.sharedInstance.logout(token: token) { [weak self] resp in
                guard let this = self else  {return}
                this.showOrHideLoader(done: true)
                AccountManager.sharedInstance.token = nil
                Router.updateRootVC()
            }
        }
        
    }
    
}
