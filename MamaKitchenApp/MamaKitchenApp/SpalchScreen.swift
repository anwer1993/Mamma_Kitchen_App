//
//  ViewController.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 13/09/2022.
//

import UIKit

class SpalchScreen: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if let token = AccountManager.sharedInstance.token , !token.isEmptyString {
                Router.shared.present(screen: .Tabbar, modalePresentatioinStyle: .fullScreen, completion: nil)
            } else {
                Router.shared.push(with: self.navigationController, screen: .Login, animated: true)
            }
            
        }
    }


}

