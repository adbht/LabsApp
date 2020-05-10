//
//  LabViewController.swift
//  Labs
//
//  Created by Adi Bhatia on 2020-05-09.
//  Copyright © 2020 Adi Bhatia. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
import ProgressHUD

class LabViewController: UIViewController {
    
    let googleMapsKey = "AIzaSyBEu8QSnEBC83Q_N3fBMCOStkuqNLYDr24"
    let baseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
    
    var name = String()
    var date = String()
    var location = String()
    var lat: Double?
    var lng: Double?
    
    
    @IBOutlet weak var mapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        GMSServices.provideAPIKey(googleMapsKey)
        getCoordinates()
    }
    
    func getCoordinates() {
        ProgressHUD.show()
        let locationTokens = location.split(separator: " ")
        var finalURL = baseURL
        for (index, token) in locationTokens.enumerated() {
            finalURL.append(contentsOf: token)
            if index != locationTokens.count - 1 {
                finalURL.append(contentsOf: "+")
            }
        }
        finalURL.append(contentsOf: "&key=\(googleMapsKey)")
        let url = URL(string: finalURL)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                self.exitWithError()
                return
            }
            let json = try! JSON(data: data)
            let results = json["results"].arrayValue
            if results.isEmpty {
                self.exitWithError()
            } else {
                self.lat = results[0]["geometry"]["location"]["lat"].double
                self.lng = results[0]["geometry"]["location"]["lng"].double
                DispatchQueue.main.async {
                    self.setUpMap()
                }
            }
        }
        task.resume()
    }
    
    func setUpMap() {
        guard let lat = self.lat, let lng = self.lng else {
            self.exitWithError()
            return
        }
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat),
                                              longitude: CLLocationDegrees(lng),
                                              zoom: 25)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.mapView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.leadingAnchor.constraint(equalTo: self.mapView.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.mapView.trailingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: self.mapView.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor).isActive = true
        let currentLocation = CLLocationCoordinate2DMake(CLLocationDegrees(lat),
                                                         CLLocationDegrees(lng))
        let marker = GMSMarker(position: currentLocation)
        marker.title = self.name
        marker.map = mapView
        ProgressHUD.dismiss()
    }
    
    func exitWithError() {
        DispatchQueue.main.async {
            ProgressHUD.showError("This lab has an invalid address")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
