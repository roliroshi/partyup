//
//  MapsViewController.swift
//  PartyUp
//
//  Created by Egon Manya on 26.06.19.
//  Copyright © 2019 roli. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class MapsViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var mapEventPreviewView = MapEventPreviewView()
    
    let locationManager = CLLocationManager()
    let currentLocationMarker = GMSMarker()
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    // The currently selected place.
    var selectedPlace: GMSPlace?

    let customMarkerWidth: Int = 50
    let customMarkerHeight: Int = 70

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
        }
        placesClient = GMSPlacesClient.shared()
        
        let camera = GMSCameraPosition.camera(withLatitude: 48.302372, longitude: 14.289802, zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.delegate = self
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        currentLocationMarker.icon = GMSMarker.markerImage(with: .purple)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        mapEventPreviewView = MapEventPreviewView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 190))
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        showPartyMarkers()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!

        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        
        self.mapView.animate(to: camera)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        locationManager.startUpdatingLocation()
        return true
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        if gesture == true {
            locationManager.stopUpdatingLocation()
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        guard let customMarkerView = marker.iconView as? CustomMarkerView else { return nil }
        let data = DataManager.events.filter{$0.id == customMarkerView.tag}.first!
        mapEventPreviewView.setData(event: data)
        return mapEventPreviewView
    }

    func showPartyMarkers() {
        mapView.clear()
        for event in DataManager.events {
            let marker = GMSMarker()
            let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: event.club.logo, borderColor: UIColor(rgb: 0x9D00A6).withAlphaComponent(0.8), tag: event.id)
            marker.iconView = customMarker
            marker.position = CLLocationCoordinate2D(latitude: event.club.latitude, longitude: event.club.longitude)
            marker.map = self.mapView
        }
    }
}
