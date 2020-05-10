//
//  LogInViewController.swift
//  Labs
//
//  Created by Adi Bhatia on 2020-05-08.
//  Copyright © 2020 Adi Bhatia. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setDelegates()
        hideKeyboardWhenTappedAround()
    }
    
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        ProgressHUD.show()
        
        guard let email = emailTextField.text else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        
        guard let password = passwordTextField.text else {
            ProgressHUD.showError("Please enter a password")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                self.emailTextField.text?.removeAll()
                self.passwordTextField.text?.removeAll()
                self.performSegue(withIdentifier: "goToLabs", sender: self)
                ProgressHUD.dismiss()
            } else {
                ProgressHUD.showError("Please enter a valid email address and password")
            }
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
