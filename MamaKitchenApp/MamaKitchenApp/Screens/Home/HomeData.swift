//
//  HomeData.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 02/10/2022.
//

import Foundation

extension HomeViewController {
    
    func getProfile() {
        if let token =  AccountManager.sharedInstance.token {
            ProfileService.sharedInstance.getProfile(token: token) {[weak self] response in
                guard let this = self else {return}
                if let response = response {
                    if response.result == true, let data = response.data {
                        AccountManager.sharedInstance.profile = data
                    }
                }
            }
        }
    }
    
}
