//
//  AuthenticationService.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation
import Alamofire

class AuthenticationService  {
    
    static var sharedInstance = AuthenticationService()
    
    func login(email: String, password: String, completion: @escaping(LoginServerResponse?) -> Void) {
        let parameters = ["email": email,
                          "password": password]
        AF.request(URLRequest.LOGIN_URL.url, method: .post, parameters: parameters).validate().responseDecodable(of: LoginServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func verifyAccount(email: String, password: String, otp: String, completion: @escaping(VerificationServerResponse?) -> Void) {
        let parameters = ["email": email,
                          "code": otp,
                          "password": password]
        AF.request(URLRequest.VERIFY.url, method: .post, parameters: parameters).validate().responseDecodable(of: VerificationServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func logout(token: String, completion: @escaping(LogoutServerResponse?) -> Void) {
        AF.request("\(URLRequest.LOGOUT.url)\(token)", method: .get).validate().responseDecodable(of: LogoutServerResponse.self) { data in
            completion(data.value)
        }
    }
    
}
