//
//  ViewController.swift
//  covid-easy-move
//
//  Created by Guillaume ESTREM on 4/11/20.
//  Copyright © 2020 Guillaume ESTREM. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mainMap: MKMapView!
     var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
        //setAuthorizedZone()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func initMap() {
      
        
        mainMap.delegate = self
        mainMap.showsUserLocation = true
        mainMap.isZoomEnabled = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        //Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        //Zoom to user location
        let noLocation = locationManager.location?.coordinate
        if (noLocation != nil) {
            let viewRegion = MKCoordinateRegion(center: noLocation!, latitudinalMeters: 200, longitudinalMeters: 200)
            mainMap.setRegion(viewRegion, animated: true)
            //locationManager.co
            //print("Location",)
        }
        
        DispatchQueue.main.async
            {
                self.locationManager.startUpdatingLocation()
        }
    }


func setAuthorizedZone(){
    
    currentLocation = CLLocationCoordinate2D(latitude: 48.855858, longitude: 2.386361)
   
    let authorizedZone = CLLocationDistance(1000)
    
    let region = MKCoordinateRegion(center: currentLocation, latitudinalMeters: authorizedZone, longitudinalMeters: authorizedZone)
    mainMap.setRegion(region, animated: true)
 
    }

}

