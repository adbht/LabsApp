//
//  AddViewController.swift
//  Labs
//
//  Created by Adi Bhatia on 2020-05-08.
//  Copyright © 2020 Adi Bhatia. All rights reserved.
//

import UIKit
import ProgressHUD

protocol AddLabDelegate {
    func addedLab(withName name: String, withDate date: String, withLocation location: String)
}

class AddLabViewController: UIViewController {
    
    var addDelegate: AddLabDelegate!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    func setDelegates() {
        nameTextField.delegate = self
        dateTextField.delegate = self
        locationTextField.delegate = self
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        sender.isEnabled = false
        guard let name = nameTextField.text, !name.isEmpty else {
            ProgressHUD.showError("Please the name of the lab")
            return
        }
        guard let date = dateTextField.text, !date.isEmpty else {
            ProgressHUD.showError("Please the date of the lab")
            return
        }
        guard let location = locationTextField.text, !location.isEmpty else {
            ProgressHUD.showError("Please the location of the lab")
            return
        }
        addDelegate.addedLab(withName: name, withDate: date, withLocation: location)
        dismiss(animated: true, completion: nil)
    }
}

extension AddLabViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
