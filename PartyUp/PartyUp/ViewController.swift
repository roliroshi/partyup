//
//  ViewController.swift
//  PartyUp
//
//  Created by roli on 22.05.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var events: [Event] = DataManager.events
    var clubs: [Club] = []
    
    let eventPics = ["event1.jpg","event2.jpg","event3.jpg","event4.jpg","event5.jpg","event6.jpg"]
    let clubPics = ["a1.jpg","feeling.png","imperio.jpg","empire.jpg","evers.jpg","remembar.jpg"]
    
    
    
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadEvents()
        // Do any additional setup after loading the view.
        
        eventCollectionView.dataSource = self
        
    }
    
    /*
    func loadEvents() {
        self.events = [
        Event(name: "Schere, STEIN, Papier!", date: "28.06.19", club: "Musikpark A1"),
        Event(name: "Jala Brat & Buba Corelli", date: "22.06.19", club: "Feeling"),
        Event(name: "IAMFBB by D2", date: "26.01.19", club: "Imperio"),
        Event(name: "Abrüsterparty", date: "27.06.19", club: "Empire St. Martin"),
        Event(name: "Sturmfrei - School's Out", date: "28.06.19", club: "Evers"),
        Event(name: "Med & Law Season Closing", date: "14.06.19", club: "Remembar")
        ]
    } */
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCell
        
        cell.eventName.text = events[indexPath.row].name
        cell.clubName.text = events[indexPath.row].club
        cell.date.text = events[indexPath.row].date
        cell.clubLogo.image = UIImage(named: clubPics[indexPath.row])
        cell.eventImage.image = UIImage(named: eventPics[indexPath.row])
        
        
        cell.clubLogo.layer.borderWidth = 2
        cell.clubLogo.layer.masksToBounds = false
        cell.clubLogo.layer.borderColor = UIColor.white.cgColor
        cell.clubLogo.layer.cornerRadius = cell.clubLogo.frame.height/2
        cell.clubLogo.clipsToBounds = true
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = eventCollectionView.cellForItem(at: indexPath)
        eventCollectionView.deselectItem(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toEventDetails", sender: cell)
    }
    
}

