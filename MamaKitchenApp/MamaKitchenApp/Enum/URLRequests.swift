//
//  URLRequests.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation

enum URLRequest: String {
    
    
    case LOGIN_URL
    case VERIFY
    case LOGOUT
    case PROFILE
    case UPDATE_PROFILE
    
    var url: String {
        switch self {
        case .LOGIN_URL:
            return "\(Tools.BASE_URL)api/v1/restaurant/login/en"
        case  .VERIFY:
            return  "\(Tools.BASE_URL)api/v1/restaurant/verify/en"
        case .LOGOUT:
            return "\(Tools.BASE_URL)api/v1/restaurant/logout/en?token="
        case .PROFILE:
            return "\(Tools.BASE_URL)api/v1/restaurant/en?token="
        case .UPDATE_PROFILE:
            return "\(Tools.BASE_URL)api/v1/restaurant/update/en"
        }
    }
}
