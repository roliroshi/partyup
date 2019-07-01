//
//  FullEventCell.swift
//  PartyUp
//
//  Created by roli on 30.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit
import GoogleMaps

class FullEventCell: UICollectionViewCell {
    
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var eventTitel: UILabel!
    @IBOutlet weak var clubName: UILabel!
    
    @IBAction func participateBtnPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Teilnehmen" {
            sender.setTitle("Nicht mehr teilnehmen", for: .normal)
        } else {
            sender.setTitle("Teilnehmen", for: .normal)
        }
    }
}
