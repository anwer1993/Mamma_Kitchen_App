//
//  TabbarViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 26/09/2022.
//

import UIKit

class TabbarViewController: UITabBarController, Storyboarded {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .macaroonYellow
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        tabBar.items![0].title = "Home"
        tabBar.items![0].tag = 0
        tabBar.items![1].title = "Orders"
        tabBar.items![0].tag = 1
        tabBar.items![2].title = "Settings"
        tabBar.items![0].tag = 2
    }

}


extension TabbarViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            
        } else if item.tag  == 1 {
            
        } else {
            
        }
    }
    
}
