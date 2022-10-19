//
//  AddNewFoodViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 11/10/2022.
//

import UIKit
import iOSDropDown

class AddNewFoodViewController: UIViewController, Storyboarded {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollViewe: UIScrollView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var categoryTxtField: DropDown!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceTxtField: UITextField!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var addBtn: UIButton!
    
    var catList = [FoodCategoryDatum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFoodCat()
    }
    
    func initView() {
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        screenTitle.textColor = .white
        backBtn.setTintColor(image: UIImage(named: "back-icon")!, withcolor: .white)
        addBtn.setupButton()
        descriptionTxtView.layer.cornerRadius = 5
        
    }
    
    func  configCategoryTextField() {
        // The list of array to display. Can be changed dynamically
        categoryTxtField.inputView = UIView()
        categoryTxtField.inputAccessoryView = UIView()
//        categoryTxtField.setRightView(image: UIImage(systemName: "arrowtriangle.down.fill"))
        categoryTxtField.text = catList.map({$0.name ?? ""}).first
        categoryTxtField.selectedIndex  = 0
        categoryTxtField.optionArray = catList.map({$0.name ?? ""})
        categoryTxtField.selectedRowColor = .kelleyGreen
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.containerView.endEditing(true)
        self.containerView.subviews.forEach { view in
            if !(view is UITextView || view is UITextField) {
                view.endEditing(true)
            }
        }
    }

    @IBAction func didTapOnBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
