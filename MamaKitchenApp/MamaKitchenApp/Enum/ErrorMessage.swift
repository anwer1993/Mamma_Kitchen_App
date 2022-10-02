//
//  ErrorMessage.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation

enum ErrorMessage: String {
    
    case INVALID_CREDENTIALS
    case INVALID_OTP
    
    var title: String {
        return "Oops"
    }
    
    var message: String {
        switch self {
        case .INVALID_CREDENTIALS:
            return "Invalid credentials"
        case .INVALID_OTP:
            return "Invalid verification code"
        }
    }
}
