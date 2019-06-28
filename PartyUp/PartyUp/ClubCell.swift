//
//  ClubCell.swift
//  PartyUp
//
//  Created by roli on 26.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

struct Club {
    
    let name: String
    let type: String
    let rating: String
    let street: String
    let city: String
    let logo: UIImage
}

class ClubCell: UICollectionViewCell{
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubType: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var clubStreet: UILabel!
    @IBOutlet weak var clubCity: UILabel!
    
}
