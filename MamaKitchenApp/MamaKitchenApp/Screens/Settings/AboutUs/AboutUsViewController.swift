//
//  AboutUsViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 29/09/2022.
//

import UIKit

class AboutUsViewController: UIViewController, Storyboarded {

    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var thirdDescLbl: UILabel!
    @IBOutlet weak var secondDescLbl: UILabel!
    @IBOutlet weak var firstDescLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var aboiutUsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        backBtn.setTintColor(image: UIImage(named: "back-icon")!, withcolor: .white)
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        titleLbl.textColor = .white
        titleLbl.text = "About us"
        aboiutUsLbl.textColor =  .macaroonYellow
        firstDescLbl.text = "With Mama's Kitchen, we focus on recreating the taste of your mama's cooking. The only difference is that your home food is delivered by  another mama."
        secondDescLbl.text = "We also want to empower people, and specially women, who have a talent for  cooking and encourage them to pursue their dream."
        thirdDescLbl.text  = "Last but no least, Mama's Kitchen aims at helping women access to mobile technology and include theem in a secure and convenient digital environment."
    }
    
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
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
