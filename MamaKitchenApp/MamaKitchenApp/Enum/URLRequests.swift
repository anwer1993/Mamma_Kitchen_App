//
//  URLRequests.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation

enum URLRequest {
    
    
    case LOGIN_URL
    case VERIFY
    case LOGOUT
    case PROFILE
    case UPDATE_PROFILE
    case GET_FOODS
    case ADD_FOOD
    case UPDATE_FOOD(id: String)
    
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
        case .GET_FOODS:
            return "\(Tools.BASE_URL)api/v1/restaurant/foods/fr?token="
        case .ADD_FOOD:
            return "\(Tools.BASE_URL)api/v1/restaurant/food/add/fr?token="
        case .UPDATE_FOOD(id: let food_id):
            return "\(Tools.BASE_URL)api/v1/restaurant/food/update/\(food_id)/fr"
        }
    }
}
