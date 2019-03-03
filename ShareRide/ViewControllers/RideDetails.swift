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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRideInfo()
        createMap()
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
    
    func createMap(){
        let annotation = MKPointAnnotation()  // <-- new 7instance here
        /*annotation.coordinate = points[index]
        annotation.title = "Point \(index+1)"
        map.addAnnotation(annotation)*/
    }
    
    func getCoordinatesFromAdress(){
        let address = "1 Infinite Loop, Cupertino, CA 95014"
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            
            
        }
    }

}
