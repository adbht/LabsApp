//
//  HomeViewController.swift
//  Labs
//
//  Created by Adi Bhatia on 2020-05-08.
//  Copyright © 2020 Adi Bhatia. All rights reserved.
//

import UIKit
import Firebase
import ProgressHUD

class HomeViewController: UIViewController {
    
    var labs = [Lab]()
    var filteredLabs = [Lab]()
    var chosenRow = Int()
    var chosenName = String()
    var chosenDate = String()
    var chosenLocation = String()
    var databaseKeys = [Int: String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var labsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated:true)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        labsTableView.delegate = self
        labsTableView.dataSource = self
        retrieveLabs()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LabViewController {
            let labVC = segue.destination as? LabViewController
            labVC?.name = chosenName
            labVC?.date = chosenDate
            labVC?.location = chosenLocation
        } else if segue.destination is EditLabViewController {
            let editLabVC = segue.destination as? EditLabViewController
            editLabVC?.labDelegate = self
            editLabVC?.name = chosenName
            editLabVC?.date = chosenDate
            editLabVC?.location = chosenLocation
        } else if segue.destination is AddLabViewController {
            let addLabVC = segue.destination as? AddLabViewController
            addLabVC?.addDelegate = self
        }
    }
    
    func updateCurrentLabDetails(for row: Int) {
        chosenRow = row
        chosenName = labs[row].name
        chosenDate = labs[row].date
        chosenLocation = labs[row].location
    }
    
    func retrieveLabs() {
        labs.removeAll()
        let labsDB = Database.database().reference().child("Labs")
        labsDB.observe(.childAdded) { snapshot in
            self.databaseKeys[self.labs.count] = snapshot.key
            let snapshotValue = snapshot.value as! [String : String]
            
            let name = snapshotValue["Name"] ?? ""
            let date = snapshotValue["Date"] ?? ""
            let location = snapshotValue["Location"] ?? ""
            
            let lab = Lab(name: name, date: date, location: location)
            self.labs.append(lab)
            self.labsTableView.estimatedRowHeight = 200.0
            self.labsTableView.reloadData()
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddLab", sender: self)
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            ProgressHUD.showError("Log out failed!")
        }
        guard navigationController?.popToRootViewController(animated: true) != nil else {
            ProgressHUD.showError("Log out failed!")
            return
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labs.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = labs[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateCurrentLabDetails(for: indexPath.row)
        performSegue(withIdentifier: "goToLab", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        retrieveLabs()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
        
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editItem = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            self.updateCurrentLabDetails(for: indexPath.row)
            self.performSegue(withIdentifier: "goToEditLab", sender: self)
            tableView.reloadData()
        }
        let deleteItem = UIContextualAction(style: .destructive, title: "Delete") {  contextualAction, view, boolValue in
            self.labs.remove(at: indexPath.row)
            tableView.reloadData()
            guard let key = self.databaseKeys[indexPath.row] else { return }
            let labsDB = Database.database().reference().child("Labs").child(key)
            labsDB.removeValue()
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem, editItem])

        return swipeActions
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            retrieveLabs()
        } else {
            filteredLabs = labs.filter { ($0.name.lowercased()).hasPrefix(searchText.lowercased()) }
            labs = filteredLabs
            labsTableView.reloadData()
        }
    }
}

extension HomeViewController: AddLabDelegate {
    func addedLab(withName name: String, withDate date: String, withLocation location: String) {
        let labDictionary = [
            "Name" : name,
            "Date": date,
            "Location": location
        ]
        let labsDB = Database.database().reference().child("Labs")
        labsDB.childByAutoId().setValue(labDictionary) { (error, _) in
            if error == nil {
                ProgressHUD.showSuccess("Lab added successfully!")
            } else {
                ProgressHUD.showError("Failed to add the new lab. Please try again.")
            }
        }
    }
}

extension HomeViewController: EditLabDelegate {
    func didChangeLab(withName name: String, withDate date: String, withLocation location: String) {
        guard let key = self.databaseKeys[chosenRow] else { return }
        let child = Database.database().reference().child("Labs").child(key)
        child.updateChildValues([
            "Name": name,
            "Date": date,
            "Location": location
        ])
        retrieveLabs()
    }
}
