//
//  Ride.swift
//  ShareRides
//
//  Created by Pablo Escriva on 27/02/2019.
//  Copyright © 2019 Pablo Escriva. All rights reserved.
//
import Foundation
import UIKit

class Ride {
    
    var id : String
    var driver : String
    var time : String
    var dropoff_location : String
    var cost : Float
    var max_riders : Int
    init(id:String,driver:String,time:String,dropoff_location:String,cost:Float,max_riders:Int) {
            self.id = id
            self.driver = driver
            self.time = time
            self.dropoff_location = dropoff_location
            self.cost = cost
            self.max_riders = max_riders
    }
}
