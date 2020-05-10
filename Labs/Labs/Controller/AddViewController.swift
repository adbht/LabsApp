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

class AddViewController: UIViewController {
    
    var addDelegate: AddLabDelegate!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBAction func addPressed(_ sender: UIButton) {
        sender.isEnabled = false
        guard let name = nameTextField.text,
            let date = dateTextField.text,
            let location = locationTextField.text else {
                ProgressHUD.showError("Please fill in all fields")
                return
        }
        addDelegate.addedLab(withName: name, withDate: date, withLocation: location)
        dismiss(animated: true, completion: nil)
    }
}
