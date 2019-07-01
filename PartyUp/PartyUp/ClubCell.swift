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
    
    var link: SelectFavoritesViewController?
    var fullHeart = false
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        link?.favouriteActuallCell(cell: self)
//
//        if !fullHeart {
//            print("funktioniert")
//
//            self.fullHeart = true
//        }
//        else{
//            sender.setImage(UIImage(named: "heartEmpty.png"), for: .normal)
//            self.fullHeart = false
//        }
    }
}
