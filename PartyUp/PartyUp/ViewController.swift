//
//  ViewController.swift
//  PartyUp
//
//  Created by roli on 22.05.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        eventCollectionView.dataSource = self
        
    }
    
   
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCell
        cell.eventImage.image = UIImage(named: "applelogo.jpg")
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

