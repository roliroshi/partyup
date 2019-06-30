//
//  ClubCell.swift
//  PartyUp
//
//  Created by roli on 26.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit



class ClubCell: UICollectionViewCell{
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubType: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var clubStreet: UILabel!
    @IBOutlet weak var clubCity: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var fullHeart: Bool = false

    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        
        if !fullHeart {
            print("funktioniert")
            favoriteButton.setImage(UIImage(named: "heart.png"), for: .normal)
            fullHeart = true
        }
        else{
            favoriteButton.setImage(UIImage(named: "heartEmpty.png"), for: .normal)
            fullHeart = false
        }
    }
}
