//
//  RideTableCell.swift
//
//
//  Created by Pablo Escriva on 27/02/2019.
//
import UIKit

class RideTableCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    func setRide(driver:String,time:String,cost:String){
        self.firstLabel.text = driver
        self.secondLabel.text = time
        self.thirdLabel.text = "$\(cost)"
    }
}
