//
//  UIViewControllerExt.swift
//  PhotoJournal
//
//  Created by Erick Wesley Espinoza on 4/25/20.
//  Copyright © 2020 HazeStudio. All rights reserved.
//

import UIKit
import Foundation

var vSpinner: UIView?

extension UIViewController {
    
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle:nil)
    }
    
    @objc func keyboardWillShow(notifaction: NSNotification) {
        if let keyboardSize = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 50
            }
        }
    }
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    func hideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    func presentAlert(title: String, message: String = "") {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
    }
    
    /// Presents an alert with customizable button title and a completion handler
    /// - Parameters:
    ///   - title: Title for alert
    ///   - message: Message for alert
    ///   - options: Button titles separated by comma
    ///   - completion: Returns which options was tapped
    /// - Reference: https://stackoverflow.com/questions/29633938/swift-displaying-alerts-best-practices
    func presentAlertWithOptions(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if options.count == 0 { //if there is no options, show a basic alert
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                 completion(0)
            })
            alertController.addAction(OKAction)
        } else { //alert with options
            for (index, option) in options.enumerated() {
                var alertStyle = UIAlertAction.Style.default
                switch option { //check if we should style the buttons
                case "Cancel": //cancel style
                    alertStyle = .cancel
                case "Logout", "Discard Changes", "Discard", "Delete", "Remove": //destructive style
                    alertStyle = .destructive
                default: break //keep as default
                }
                alertController.addAction(UIAlertAction(title: option, style: alertStyle, handler: { (action) in
                    completion(index)
                }))
            }
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentAlertWithPassword(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Confirm",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))

        self.present(alert, animated: true, completion: nil)
    }

}
