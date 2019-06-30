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
    
}

struct Event {
    let name: String
    let date: String
    let club: String
    let eventImage: UIImage
    let clubLogo: UIImage
    
}


class DataManager{
    
    static let clubs: [Club] = [
        Club(name: "Musikpark A1", type: "Club", rating: "★ 4.7", street: "Hamerlingstraße 42", city: "4020 Linz", logo: UIImage(named: "a1.jpg") ?? UIImage(named: "applelogo.jpg")!),
        Club(name: "Imperio", type: "Club", rating: "★ 5.0", street: "Eduard-Sueß-Straße 19", city: "4030 Linz", logo: UIImage(named: "imperio.jpg")!),
        Club(name: "Spielplatz", type: "Club", rating: "★ 3.9", street: "Hauptstraße 4", city: "4040 Linz", logo: UIImage(named: "spielplatz.png") ?? UIImage(named: "applelogo.jpg")!),
        Club(name: "Feeling", type: "Club", rating: "★ 3.6", street: "Wiesenstraße 60 A", city: "4600 Wels", logo: UIImage(named: "feeling.png") ?? UIImage(named: "applelogo.jpg")!),
        Club(name: "Empire St. Martin", type: "Club", rating: "★ 4.1", street: "Allersdorf 20", city: "4113 Sankt Martin/Mühlkreis", logo: UIImage(named: "empire.jpg") ?? UIImage(named: "applelogo.jpg")!),
        Club(name: "Segabar", type: "Bar", rating: "★ 3.9", street: " Hofgasse 9", city: "4020 Linz", logo: UIImage(named: "segabar.png") ?? UIImage(named: "empire.jpg")!),
        Club(name: "Remembar", type: "Bar", rating: "★ 3.4", street: "Landstraße 17-25", city: "4020 Linz", logo: UIImage(named: "remembar.jpg") ?? UIImage(named: "empire.jpg")!),
        Club(name: "Evers", type: "Club", rating: "★ 4.0", street: "Betriebsstraße 15", city: "4210 Radingdorf", logo: UIImage(named: "evers.jpg") ?? UIImage(named: "empire.jpg")!),
        Club(name: "Mausefalle", type: "Bar", rating: "★ 4.0", street: "Wegscheider Str. 3", city: "4020 Linz", logo: UIImage(named: "mausefalle.jpg") ?? UIImage(named: "empire.jpg")!)
        ]
    
   
    
    static let events: [Event] = [
        Event(name: "Schere, STEIN, Papier!", date: "28.06.19", club: clubs[0].name, eventImage: UIImage(named: "event1.jpg")!, clubLogo: UIImage(named: "a1.jpg")!),
        Event(name: "Jala Brat & Buba Corelli", date: "22.06.19", club: "Feeling", eventImage: UIImage(named: "event2.jpg")!, clubLogo: UIImage(named: "feeling.png")!),
        Event(name: "IAMFBB by D2", date: "26.01.19", club: "Imperio", eventImage: UIImage(named: "event3.jpg")!, clubLogo: UIImage(named: "imperio.jpg")!),
        Event(name: "Abrüsterparty", date: "27.06.19", club: "Empire St. Martin", eventImage: UIImage(named: "event4.jpg")!, clubLogo: UIImage(named: "empire.jpg")!),
        Event(name: "Sturmfrei - School's Out", date: "28.06.19", club: "Evers", eventImage: UIImage(named: "event5.jpg")!, clubLogo: UIImage(named: "evers.jpg")!),
        Event(name: "Med & Law Season Closing", date: "14.06.19", club: "Remembar", eventImage: UIImage(named: "event6.jpg")!, clubLogo: UIImage(named: "remembar.jpg")!)
    ]
    
    static let myEvents: [Event] = [
         Event(name: "IAMFBB by D2", date: "26.01.19", club: "Imperio", eventImage: UIImage(named: "event3.jpg")!, clubLogo: UIImage(named: "imperio.jpg")!),
         Event(name: "Jala Brat & Buba Corelli", date: "22.06.19", club: "Feeling", eventImage: UIImage(named: "event2.jpg")!, clubLogo: UIImage(named: "feeling.png")!)
    ]
    
    static let favoriteEvents: [Event] = [
        Event(name: "Med & Law Season Closing", date: "14.06.19", club: "Remembar", eventImage: UIImage(named: "event6.jpg")!, clubLogo: UIImage(named: "remembar.jpg")!),
        Event(name: "IAMFBB by D2", date: "26.01.19", club: "Imperio", eventImage: UIImage(named: "event3.jpg")!, clubLogo: UIImage(named: "imperio.jpg")!),
         Event(name: "Schere, STEIN, Papier!", date: "28.06.19", club: clubs[0].name, eventImage: UIImage(named: "event1.jpg")!, clubLogo: UIImage(named: "a1.jpg")!)
    ]
    
}
