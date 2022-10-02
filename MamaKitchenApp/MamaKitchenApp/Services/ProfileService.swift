//
//  ProfileService.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 02/10/2022.
//

import Foundation
import Alamofire

class ProfileService {
    
    static var sharedInstance = ProfileService()
    
    func getProfile(token: String, completion: @escaping(ProfileServerResponse?) -> Void) {
        print("\(URLRequest.PROFILE.url)\(token)")
        AF.request("\(URLRequest.PROFILE.url)\(token)", method: .get).validate().responseDecodable(of: ProfileServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func updateProfile(profile: ProfileModel, token: String, completion: @escaping(ProfileServerResponse?) -> Void) {
        let parameters = ["first_name": profile.firstName,
                          "last_name": profile.lastName,
                          "restaurant_name": profile.restaurantName,
                          "id_number": profile.idNumber,
                          "phone": profile.phone,
                          "password": AccountManager.sharedInstance.password,
//                          "picture": profile.picture,
                          "email": profile.email,
                          "address": profile.address,
//                          "longitude": profile.longitude,
//                          "latitude": profile.latitude
        ]
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(URLRequest.UPDATE_PROFILE.url, method: .put, parameters: parameters, headers: headers).validate().responseDecodable(of: ProfileServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    
}
