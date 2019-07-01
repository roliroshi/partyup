//
//  RestaurantPreviewView.swift
//  googlMapTutuorial2
//
//  Created by Muskan on 12/17/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import Foundation
import UIKit

class MapEventPreviewView: UIView {
    
    @IBOutlet weak var imgView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(event: Event) {
//        lblTitle.text = event.club.name
        imgView.image = event.eventImage
//        lblDate.text = event.date
    }
    
}
