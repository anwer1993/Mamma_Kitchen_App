//
//  FoodServerResponseModel.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 09/10/2022.
//

import Foundation

// MARK: - FoodServerResponse
struct FoodServerResponse: Codable {
    let result: Bool?
    let message: String?
    let data: FoodDataClass?
}

// MARK: - DataClass
struct FoodDataClass: Codable {
    let currentPage: Int?
    let data: [FoodDatum]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let links: [Link]?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct FoodDatum: Codable {
    let id, userID, foodCategoryID: Int?
    let name, datumDescription, picture, price: String?
    let reduction, timePreparing, isOpened: Int?
    let createdAt, updatedAt, foodCategoryName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case foodCategoryID = "food_category_id"
        case name
        case datumDescription = "description"
        case picture, price, reduction
        case timePreparing = "time_preparing"
        case isOpened = "is_opened"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case foodCategoryName = "food_category_name"
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}


// MARK: - FoodServerResponse
struct UpdateFoodServerResponse: Codable {
    let result: Bool?
    let message: String?
    let data: FoodDatum?
}

// MARK: - FoodServerResponse
struct AddFoodServerResponse: Codable {
    let result: Bool?
    let message: String?
    let data: FoodDatum?
}


struct FoodEditableModel: Codable {
    let name: String
    let food_category_id: String
    let edited_description: String
    let price: Double
    let time_preparing: Int
}

struct NewFoodModel: Codable {
    let name: String
    let food_category_id: String
    let new_food_description: String
    let price: Double
    let time_preparing: Int
    let picture: Data?
}

// MARK: - FoodCategoryServerResponse
struct FoodCategoryServerResponse: Codable {
    let result: Bool?
    let message: String?
    let data: [FoodCategoryDatum]?
}

// MARK: - Datum
struct FoodCategoryDatum: Codable {
    let id: Int?
    let name: String?
    let picture: Picture?
    let color: Color?
}

enum Color: String, Codable {
    case ff5733 = "#FF5733"
    case the3347Ff = "#3347ff"
    case the8Aff33 = "#8AFF33"
}

enum Picture: String, Codable {
    case categoriesHamburgerPNG = "categories/hamburger.png"
    case categoriesPizzaPNG = "categories/pizza.png"
    case categoriesSweetsPNG = "categories/sweets.png"
}
