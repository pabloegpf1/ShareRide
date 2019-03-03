//
//  RideDetails.swift
//  ShareRide
//
//  Created by Pablo Escriva on 02/03/2019.
//  Copyright © 2019 SFHacks. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import CoreLocation

class RideDetails: UIViewController {
    
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var maxRidersLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var center: CLLocationCoordinate2D!
    var region: MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRideInfo()
        setupMap()
    }
    
    @IBAction func joinRide(_ sender: Any) {
        ref.child("riders/\(selectedRide.id)").child((Auth.auth().currentUser?.uid)!)
            .setValue(Auth.auth().currentUser?.email)
    }
    
    func populateRideInfo(){
        driverLabel.text = selectedRide.driver
        maxRidersLabel.text = "\(selectedRide.max_riders)"
        costLabel.text = "\(selectedRide.cost)"
        timeLabel.text = selectedRide.time
    }
    
    func setupMap(){
        let address = "\(selectedRide.dropoff_location),San Francisco, CA"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            let annotation = MKPointAnnotation()
            self.center = location.coordinate
            annotation.coordinate = self.center
            annotation.title = selectedRide.dropoff_location
            self.map.addAnnotation(annotation)
            self.region = MKCoordinateRegion(center: self.center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.map.setRegion(self.region, animated: true)
        }
    }
    
    @IBAction func tapOnMap(_ sender: Any) {
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: self.region.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: self.region.span)
        ]
        let placemark = MKPlacemark(coordinate: center, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "DropOff"
        mapItem.openInMaps(launchOptions: options)
    }
    
}
