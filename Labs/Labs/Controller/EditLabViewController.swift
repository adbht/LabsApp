//
//  EditLabViewController.swift
//  Labs
//
//  Created by Adi Bhatia on 2020-05-09.
//  Copyright © 2020 Adi Bhatia. All rights reserved.
//

import UIKit
import ProgressHUD

protocol EditLabDelegate {
    func didChangeLab(withName name: String, withDate date: String, withLocation location: String)
}

class EditLabViewController: UIViewController {
    
    var name = String()
    var date = String()
    var location = String()
    var newName = String()
    var newDate = String()
    var newLocation = String()
    var labDelegate: EditLabDelegate!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setUpViews()
    }
    
    func setDelegates() {
        nameTextField.delegate = self
        dateTextField.delegate = self
        locationTextField.delegate = self
    }
    
    func setUpViews() {
        view.backgroundColor = .white
        nameTextField.text = name
        dateTextField.text = date
        locationTextField.text = location
    }
    
    @IBAction func nameUpdated(_ sender: UITextField) {
        guard let newName = sender.text, !newName.isEmpty else {
            ProgressHUD.showError("Please enter a valid name")
            return
        }
        self.newName = newName
    }
    
    @IBAction func dateUpdated(_ sender: UITextField) {
        guard let newDate = sender.text, !newDate.isEmpty else {
            ProgressHUD.showError("Please enter a valid date")
            return
        }
        self.newDate = newDate
    }
    
    @IBAction func locationUpdated(_ sender: UITextField) {
        guard let newLocation = sender.text, !newLocation.isEmpty else {
            ProgressHUD.showError("Please enter a valid location")
            return
        }
        self.newLocation = newLocation
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        if !newName.isEmpty {
            labDelegate.didChangeLab(withName: newName, withDate: date, withLocation: location)
        }
        if !newDate.isEmpty {
            labDelegate.didChangeLab(withName: name, withDate: newDate, withLocation: location)
        }
        if !newLocation.isEmpty {
            labDelegate.didChangeLab(withName: name, withDate: date, withLocation: newLocation)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension EditLabViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
