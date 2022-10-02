//
//  SettinngsViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 28/09/2022.
//

import UIKit

class SettinngsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var versionView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var aboutUsView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineView2: UIView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutlbl: UILabel!
    @IBOutlet weak var logoutStackView: UIStackView!
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet weak var versionStaticLbl: UILabel!
    @IBOutlet weak var versionStackView: UIStackView!
    @IBOutlet weak var contactUsLbl: UILabel!
    @IBOutlet weak var contactUsStackView: UIStackView!
    @IBOutlet weak var aboutUsLbl: UILabel!
    @IBOutlet weak var aboutUSStackView: UIStackView!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var profileStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        initView()
        addTapGesture()
    }
    
    func initView() {
        titleView.layer.backgroundColor = UIColor.kelleyGreen.cgColor
        titleLbl.textColor = .white
        styleView(menuStackView)
        styleView(logoutView)
        profileView.layer.cornerRadius = 10
        profileView.layer.maskedCorners =  [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        versionView.layer.cornerRadius = 10
        versionView.layer.maskedCorners =  [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        menuStackView.subviews.forEach { view in
            if view.tag == 100 {
                view.layer.backgroundColor = UIColor.gray.cgColor
            }
        }
        versionLbl.textColor = .macaroonYellow
    }
    
    func styleView(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.applySketchShadow(color: .black9, alpha: 1, x: 0, y: 5, blur: 10, spread: 0)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addTapGesture()  {
        let logoutTap = UITapGestureRecognizer(target: self, action: #selector(handleLogoutTap(_:)))
        logoutStackView.addTagGesture(logoutTap)
        let aboutUsTap = UITapGestureRecognizer(target: self, action: #selector(handleAboutUsTap(_:)))
        aboutUSStackView.addTagGesture(aboutUsTap)
        let contactUsTap = UITapGestureRecognizer(target: self, action: #selector(handleContactUsTap(_:)))
        contactUsStackView.addTagGesture(contactUsTap)
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(handleProfileTap(_:)))
        profileStackView.addTagGesture(profileTap)
    }
    
    @objc func handleAboutUsTap(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.present(screen: .AboutUs, modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    @objc func handleContactUsTap(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.present(screen: .ContactUs, modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    @objc func handleProfileTap(_ sender: UITapGestureRecognizer? = nil) {
        Router.shared.present(screen: .Register(source: .fromSettings), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    @objc func handleLogoutTap(_ sender: UITapGestureRecognizer? = nil) {
        showAlertWithCancel(withTitle: "Logout", withMessage: "Are you sure you want to logout from the application") {
            self.logout()
        }
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
