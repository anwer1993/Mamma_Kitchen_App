//
//  HomeTableView.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 11/10/2022.
//

import Foundation
import SkeletonView
import UIKit

extension HomeViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Food_Cell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = skeletonView.dequeueReusableCell(withIdentifier: "Food_Cell", for: indexPath) as? FoodCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Food_Cell", for: indexPath) as? FoodCell else {
            return UITableViewCell()
        }
        cell.configCell()
        return cell
    }
    
    
    
}
