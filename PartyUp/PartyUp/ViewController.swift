//
//  ViewController.swift
//  PartyUp
//
//  Created by roli on 22.05.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        cell.titleLabel?.text = "Event Name"
        cell.dateLabel?.text = "22.05.19"
        cell.nameLabel?.text = "Club Name"
        
        return cell
    }
    
    
}

