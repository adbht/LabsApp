//
//  AddLabViewController.swift
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
    var datePicker: UIDatePicker?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setUpViews()
        hideKeyboardWhenTappedAround()
    }
    
    func setDelegates() {
        nameTextField.delegate = self
        dateTextField.delegate = self
        locationTextField.delegate = self
    }
    
    func setUpViews() {
        datePicker = UIDatePicker()
        datePicker?.backgroundColor = .white
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
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
