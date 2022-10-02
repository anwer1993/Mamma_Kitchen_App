//
//  OrdersViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 29/09/2022.
//

import UIKit

class OrdersViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var historyIndicator: UIView!
    @IBOutlet weak var historyLbl: UILabel!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var currentOrdersIndicator: UIView!
    @IBOutlet weak var currentOrdersLbl: UILabel!
    @IBOutlet weak var newOrdersView: UIView!
    @IBOutlet weak var currentOrderView: UIView!
    @IBOutlet weak var newOrdersIndicator: UIView!
    @IBOutlet weak var newOrdersLbl: UILabel!
    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var menuView: UIView!
    
    var selectedItem = 0 {
        didSet {
            styleMenu()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        titleLbl.textColor = .white
        menuView.backgroundColor = .emerald
        styleMenu()
    }
    
    func styleMenu() {
        switch selectedItem {
        case 0:
            activateItem(title: newOrdersLbl, indicator: newOrdersIndicator)
            deactivateItem(title: currentOrdersLbl, indicator: currentOrdersIndicator)
            deactivateItem(title: historyLbl, indicator: historyIndicator)
            break
        case 1:
            deactivateItem(title: newOrdersLbl, indicator: newOrdersIndicator)
            activateItem(title: currentOrdersLbl, indicator: currentOrdersIndicator)
            deactivateItem(title: historyLbl, indicator: historyIndicator)
            break
        case 2:
            deactivateItem(title: newOrdersLbl, indicator: newOrdersIndicator)
            deactivateItem(title: currentOrdersLbl, indicator: currentOrdersIndicator)
            activateItem(title: historyLbl, indicator: historyIndicator)
            break
        default:
            break
        }
    }
    
    func activateItem(title: UILabel, indicator: UIView) {
        title.textColor = .macaroonYellow
        indicator.layer.backgroundColor  = UIColor.macaroonYellow.cgColor
    }
    
    func deactivateItem(title: UILabel, indicator: UIView) {
        title.textColor = .white
        indicator.layer.backgroundColor  = UIColor.emerald.cgColor
    }
    
    @IBAction func didUpdateSelectedItem(_ sender: UIButton) {
        selectedItem = sender.tag
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
