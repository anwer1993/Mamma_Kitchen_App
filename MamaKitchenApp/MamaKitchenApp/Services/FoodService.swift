//
//  FoodService.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 09/10/2022.
//

import Foundation
import Alamofire

class FoodService {
    
    
    static var shared = FoodService()
    
    func getFood(token: String, completion: @escaping(FoodServerResponse?) -> Void) {
        AF.request("\(URLRequest.GET_FOODS.url)\(token)", method: .get).validate().responseDecodable(of: FoodServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func getFoodCat(completion: @escaping(FoodCategoryServerResponse?) -> Void) {
        AF.request("\(URLRequest.FOOD_CAT_URL.url)", method: .get).validate().responseDecodable(of: FoodCategoryServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func updateFood(food_id: String, token: String, newModel:FoodEditableModel, completion: @escaping(UpdateFoodServerResponse?) -> Void) {
        let parameters = ["name": newModel.name,
                          "food_category_id": newModel.food_category_id,
                          "description": newModel.edited_description,
                          "price": newModel.price,
                          "time_preparing": newModel.time_preparing] as? Parameters
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(URLRequest.UPDATE_FOOD(id: food_id).url, method: .put, parameters: parameters, headers: headers).validate().responseDecodable(of: UpdateFoodServerResponse.self) { data in
            completion(data.value)
        }
    }
    
    func addFood(newFoodModel: NewFoodModel, token: String, completion: @escaping(AddFoodServerResponse?) -> Void) {
        var parameters: Parameters = [:]
        if let picture = newFoodModel.picture {
            parameters = ["food_category_id": newFoodModel.food_category_id,
                              "name": newFoodModel.name,
                              "description": newFoodModel.new_food_description,
                              "price": newFoodModel.price,
                              "time_preparing": newFoodModel.time_preparing,
                              "picture": picture]
        } else {
            parameters = ["food_category_id": newFoodModel.food_category_id,
                              "name": newFoodModel.name,
                              "description": newFoodModel.new_food_description,
                              "price": newFoodModel.price,
                              "time_preparing": newFoodModel.time_preparing]
        }
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(URLRequest.ADD_FOOD.url, method: .post, parameters: parameters, headers: headers).validate().responseDecodable(of: AddFoodServerResponse.self) { data in
            completion(data.value)
        }
    }
    
}
