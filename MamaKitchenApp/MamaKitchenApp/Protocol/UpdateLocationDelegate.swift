//
//  UpdateLocationDelegate.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 19/10/2022.
//

import Foundation


public protocol  UpdateLocationDelegate {
    
    func updateLocation(latitude: Double, longitude: Double, address: String)
}
