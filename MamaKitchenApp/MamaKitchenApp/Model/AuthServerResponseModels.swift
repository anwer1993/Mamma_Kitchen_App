//
//  LoginServerResponse.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation

// MARK: - LoginServerResponse
struct LoginServerResponse: Codable {
    let result: Bool
    let message: String
    let code: String?
}

// MARK: - LogoutServerResponse
struct LogoutServerResponse: Codable {
    let result: Bool?
    let message: String?
    let data: LogoutServerResponseDataClass?
}

// MARK: - LogoutServerResponse
struct LogoutServerResponseDataClass: Codable {
}


// MARK: - VerificationServerResponse
struct VerificationServerResponse: Codable {
    let result: Bool
    let message: String
    let token: String?
}
