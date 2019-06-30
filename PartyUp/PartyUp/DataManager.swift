//
//  DataManager.swift
//  PartyUp
//
//  Created by roli on 29.06.19.
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
    //let events: [Event]
    let latitude: Double
    let longitude: Double
}

struct Event {
    let id: Int
    let name: String
    let date: String
    let club: Club
    let eventImage: UIImage
    
}


class DataManager{
    
    static let clubs: [Club] = [
        Club(name: "Musikpark A1", type: "Club", rating: "★ 4.7", street: "Hamerlingstraße 42", city: "4020 Linz", logo: UIImage(named: "a1.jpg") ?? UIImage(named: "applelogo.jpg")!, latitude: 48.292050, longitude: 14.303350),
        Club(name: "Imperio", type: "Club", rating: "★ 5.0", street: "Eduard-Sueß-Straße 19", city: "4030 Linz", logo: UIImage(named: "imperio.jpg")!, latitude: 48.256150, longitude: 14.279580),
        Club(name: "Spielplatz", type: "Club", rating: "★ 3.9", street: "Hauptstraße 4", city: "4040 Linz", logo: UIImage(named: "spielplatz.png") ?? UIImage(named: "applelogo.jpg")!, latitude: 48.310120, longitude: 14.283850),
        Club(name: "Feeling", type: "Club", rating: "★ 3.6", street: "Wiesenstraße 60 A", city: "4600 Wels", logo: UIImage(named: "feeling.png") ?? UIImage(named: "applelogo.jpg")!, latitude: 48.162310, longitude: 14.044360),
        Club(name: "Empire St. Martin", type: "Club", rating: "★ 4.1", street: "Allersdorf 20", city: "4113 Sankt Martin/Mühlkreis", logo: UIImage(named: "empire.jpg") ?? UIImage(named: "applelogo.jpg")!, latitude: 48.416890, longitude: 14.060460),
        Club(name: "Segabar", type: "Bar", rating: "★ 3.9", street: " Hofgasse 9", city: "4020 Linz", logo: UIImage(named: "segabar.png") ?? UIImage(named: "empire.jpg")!, latitude: 48.305700, longitude: 14.285010),
        Club(name: "Remembar", type: "Bar", rating: "★ 3.4", street: "Landstraße 17-25", city: "4020 Linz", logo: UIImage(named: "remembar.jpg") ?? UIImage(named: "empire.jpg")!, latitude: 48.303090, longitude: 14.289860),
        Club(name: "Evers", type: "Club", rating: "★ 4.0", street: "Betriebsstraße 15", city: "4210 Radingdorf", logo: UIImage(named: "evers.jpg") ?? UIImage(named: "empire.jpg")!, latitude: 48.359039, longitude: 14.479300),
        Club(name: "Mausefalle", type: "Bar", rating: "★ 4.0", street: "Wegscheider Str. 3", city: "4020 Linz", logo: UIImage(named: "mausefalle.jpg") ?? UIImage(named: "empire.jpg")!, latitude: 48.253820, longitude: 14.280160)
        ]
    
   
    
    static let events: [Event] = [
        Event(id: 0, name: "Schere, STEIN, Papier!", date: "28.06.19", club: clubs[0], eventImage: UIImage(named: "event1.jpg")!),
        Event(id: 1, name: "Jala Brat & Buba Corelli", date: "22.06.19", club: clubs[3], eventImage: UIImage(named: "event2.jpg")!),
        Event(id: 2, name: "IAMFBB by D2", date: "26.01.19", club: clubs[1], eventImage: UIImage(named: "event3.jpg")!),
        Event(id: 3, name: "Abrüsterparty", date: "27.06.19", club: clubs[4], eventImage: UIImage(named: "event4.jpg")!),
        Event(id: 4, name: "Sturmfrei - School's Out", date: "28.06.19", club: clubs[7], eventImage: UIImage(named: "event5.jpg")!),
        Event(id: 5, name: "Med & Law Season Closing", date: "14.06.19", club: clubs[6], eventImage: UIImage(named: "event6.jpg")!)
    ]
    
    static let myEvents: [Event] = [DataManager.events[2], DataManager.events[1]]
    
    static let favoriteEvents: [Event] = [DataManager.events[5], DataManager.events[2], DataManager.events[0]]
    
}
