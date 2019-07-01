//
//  SelectFavoritesViewController.swift
//  PartyUp
//
//  Created by roli on 26.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit

struct ClubsCollection {
    var hasFavorited: Bool
    let club: Club
}

class SelectFavoritesViewController: UIViewController {
    @IBOutlet weak var clubsCollectionView: UICollectionView!
    @IBOutlet weak var exitButton: UIButton!
    
    var clubs: [ClubsCollection] = []
    
    let defaults = UserDefaults.standard
    
    let cellScale: CGFloat = 0.8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.clubs.forEach{ clubs.append(ClubsCollection(hasFavorited: false, club: $0))}
        
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
        clubsCollectionView.reloadData()
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        print(clubs.filter{$0.hasFavorited}.count)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func favouriteActuallCell(cell: ClubCell) {
        if let index = clubsCollectionView.indexPath(for: cell) {
            let currentClub = clubs[(index.row)]
            clubs[(index.row)].hasFavorited = !currentClub.hasFavorited
            clubsCollectionView.reloadItems(at: [index])
        }
    }
}

extension SelectFavoritesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCell", for: indexPath) as! ClubCell
        cell.link = self
        cell.layer.cornerRadius = 49
        
        cell.clubName.text = clubs[indexPath.row].club.name
        cell.clubType.text = clubs[indexPath.row].club.type
        cell.ratingLabel.text = clubs[indexPath.row].club.rating
        cell.clubStreet.text = clubs[indexPath.row].club.street
        cell.clubCity.text = clubs[indexPath.row].club.city
        cell.logoImage.image = clubs[indexPath.row].club.logo
        if clubs[indexPath.row].hasFavorited {
            cell.favoriteButton.setImage(UIImage(named: "heart.png"), for: .normal)
        } else {
            cell.favoriteButton.setImage(UIImage(named: "heartEmpty.png"), for: .normal)
        }
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

