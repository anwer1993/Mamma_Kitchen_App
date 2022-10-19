//
//  HomeViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 29/09/2022.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {

    
    
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var addFoodView: UIView!
    @IBOutlet weak var foodTableView: UITableView!
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleAddFoodTap(_:)))
        addFoodView.addTagGesture(tap)
        addFoodView.layer.cornerRadius = addFoodView.frame.width * 0.5
        addFoodView.backgroundColor = .macaroonYellow
        addFoodView.applySketchShadow(color: .black37, alpha: 1, x: 0, y: 5, blur: 10, spread: 0)
        self.addFoodView.isHidden = true
        foodTableView.dataSource = self
        self.foodTableView.showAnimatedSkeleton(usingColor: .kelleyGreen, animation: .none, transition: .crossDissolve(5.0))
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.foodTableView.hideSkeleton()
            self.foodTableView.reloadData()
            self.addFoodView.isHidden = false
        }
    }
    
    @objc func handleAddFoodTap(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.present(screen: .AddNewFood, modalePresentatioinStyle: .fullScreen, completion: nil)
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
