//
//  ProfileServerResponseModel.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 02/10/2022.
//

import Foundation

// MARK: - ProfileServerResponse
struct ProfileServerResponse: Codable {
    var result: Bool?
    var message: String?
    var data: ProfileModel?
}

// MARK: - DataClass
struct ProfileModel: Codable {
    var id: Int?
    var firstName, lastName, phone, restaurantName: String?
    var picture, code, deviceToken, email: String?
    var address, longitude, latitude: String?
    var emailVerifiedAt: String?
    var idNumber: String?
    var idPicture, bank, iban: String?
    var isPhoneVerified, isApproved, isActive, isBanned: String?
    var isNotifiable: Int?
    var userType, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
        case restaurantName = "restaurant_name"
        case picture, code
        case deviceToken = "device_token"
        case email, address, longitude, latitude
        case emailVerifiedAt = "email_verified_at"
        case idNumber = "id_number"
        case idPicture = "id_picture"
        case bank, iban
        case isPhoneVerified = "is_phone_verified"
        case isApproved = "is_approved"
        case isActive = "is_active"
        case isBanned = "is_banned"
        case isNotifiable = "is_notifiable"
        case userType = "user_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
