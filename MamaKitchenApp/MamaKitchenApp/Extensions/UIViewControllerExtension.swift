//
//  UIViewControllerExtension.swift
//  Mama's Kitchen Restaurant
//
//  Created by Anwar Hajji on 25/09/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: "Oops", message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithCancel(withTitle title: String, withMessage message: String, confirmAction: @escaping() -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let OkAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            confirmAction()
        }
        alert.addAction(cancelAction)
        alert.addAction(OkAction)
        self.present(alert, animated: true)
    }
    
    func showAlertWithOk(withTitle title: String, withMessage message: String, confirmAction: @escaping() -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            confirmAction()
        }
        alert.addAction(OkAction)
        self.present(alert, animated: true)
    }
    
    func showOrHideLoader(done: Bool) {
        if done {
            dismiss(animated: false, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
