//
//  LocationViewController.swift
//  MamaKitchenApp
//
//  Created by Anwar Hajji on 19/10/2022.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, MKMapViewDelegate, Storyboarded {
    
    
    
    @IBOutlet weak var selectViewBtn: UIButton!
    @IBOutlet weak var selectLocationView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var myLocation:CLLocationCoordinate2D?
    var delegate: UpdateLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    func getAddressFromLatLon(latitude: Double, withLongitude longitude: Double, completion:@escaping (String) -> ()){
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = latitude
        center.longitude = longitude
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
                                    {(placemarks, error) in
            if (error != nil)
            {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            let pm = placemarks! as [CLPlacemark]
            
            if pm.count > 0 {
                let pm = placemarks![0]
                var addressString : String = ""
                if pm.subLocality != nil {
                    addressString = addressString + pm.subLocality! + ", "
                }
                if pm.thoroughfare != nil {
                    addressString = addressString + pm.thoroughfare! + ", "
                }
                if pm.locality != nil {
                    addressString = addressString + pm.locality! + ", "
                }
                if pm.country != nil {
                    addressString = addressString + pm.country! + ", "
                }
                if pm.postalCode != nil {
                    addressString = addressString + pm.postalCode! + " "
                }
                completion(addressString)
            }
        })
    }
    
    @IBAction func selectLocationDidTapped(_ sender: Any) {
        getAddressFromLatLon(latitude: myLocation?.latitude ?? 0.0, withLongitude: myLocation?.longitude ?? 0.0) { address in
            if !address.isEmptyString {
                self.delegate?.updateLocation(latitude: self.myLocation?.latitude  ?? 0.0, longitude: self.myLocation?.longitude ?? 0.0, address: address)
                self.dismiss(animated: true)
            }
        }
    }
    
}


extension LocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        myLocation = latestLocation.coordinate
        if let myLocation = myLocation {
            zoomToLatestLocation(with: myLocation)
        }
        
    }
    
}
