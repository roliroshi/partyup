//
//  SelectFavoritesViewController.swift
//  PartyUp
//
//  Created by roli on 26.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

class SelectFavoritesViewController: UIViewController {
    @IBOutlet weak var clubsCollectionView: UICollectionView!
    @IBOutlet weak var exitButton: UIButton!
    
    var favoriteClubs: [Club] = []
    
    let defaults = UserDefaults.standard
    
    let cellScale: CGFloat = 0.8
    
    var clubs: [Club] = DataManager.clubs
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // loadClubs()
        
        /*
        let layout = clubsCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = layout.itemSize.height
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        clubsCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        */
        
        clubsCollectionView.dataSource = self
        clubsCollectionView.delegate = self
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        for cell in clubsCollectionView.visibleCells as! [ClubCell] {
            if cell.fullHeart {
                favoriteClubs.append(Club(name: cell.clubName.text!, type: cell.clubType.text!, rating: cell.ratingLabel.text!, street: cell.clubStreet.text!, city: cell.clubCity.text!, logo: UIImage(named: "applelogo.jpg")!))
            }
        }
        print(favoriteClubs.count)
    }
    
    
    /*
    func loadClubs() {
        self.clubs = [
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
    } */
    
}

extension SelectFavoritesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCell", for: indexPath) as! ClubCell
        cell.layer.cornerRadius = 49
        
        cell.clubName.text = clubs[indexPath.row].name
        cell.clubType.text = clubs[indexPath.row].type
        cell.ratingLabel.text = clubs[indexPath.row].rating
        cell.clubStreet.text = clubs[indexPath.row].street
        cell.clubCity.text = clubs[indexPath.row].city
        cell.logoImage.image = clubs[indexPath.row].logo
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }  
    
}

extension SelectFavoritesViewController: UIScrollViewDelegate, UICollectionViewDelegate{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.clubsCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) /
        cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
    }
}

