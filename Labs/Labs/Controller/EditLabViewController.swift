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
    var labDelegate: EditLabDelegate!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        view.backgroundColor = .white
        nameTextField.text = name
        dateTextField.text = date
        locationTextField.text = location
    }
    
    @IBAction func nameUpdated(_ sender: UITextField) {
        guard let newName = sender.text else {
            ProgressHUD.showError("Please enter a valid name")
            return
        }
        labDelegate.didChangeLab(withName: newName, withDate: date, withLocation: location)
    }
    
    @IBAction func dateUpdated(_ sender: UITextField) {
        guard let newDate = sender.text else {
            ProgressHUD.showError("Please enter a valid date")
            return
        }
        labDelegate.didChangeLab(withName: name, withDate: newDate, withLocation: location)
    }
    
    @IBAction func locationUpdated(_ sender: UITextField) {
        guard let newLocation = sender.text else {
            ProgressHUD.showError("Please enter a valid location")
            return
        }
        labDelegate.didChangeLab(withName: name, withDate: date, withLocation: newLocation)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
