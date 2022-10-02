//
//  HomeViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 29/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        initView()
        getProfile()
    }
    
    func initView() {
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        titleLbl.textColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
