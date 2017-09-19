//
//  ViewController.swift
//  Swift3MapHelloWorld
//
//  Created by Diego Freniche Brito on 23/02/17.
//  Copyright © 2017 Diego Freniche Brito. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


// MKAnnotation requires that the object inherit from NSObjectProtocol. To do that, you should have your class inherit from NSObject
// You should declare your properties to match those of the MKAnnotation protocol
class Note: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class ViewController: UIViewController, MKMapViewDelegate {

    var locationManager: CLLocationManager?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        self.mapView.delegate = self
        
        
        let londonLocation = CLLocation(latitude: 51.5073509, longitude: -0.1277583)
        self.mapView.setCenter(londonLocation.coordinate, animated: true)
        
        let region = MKCoordinateRegion(center: londonLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        let reg = self.mapView.regionThatFits(region)
        self.mapView.setRegion(reg, animated: true)
        
        
        let n=Note(coordinate: londonLocation.coordinate, title: "Hello", subtitle: "Hello sub")
        self.mapView.addAnnotation(n)
    }
    
    func setRegion() {
        
        
    }
    
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("*** MAP STARTING")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("** MAP FINISH LOADING")
    }

    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("** START LOCATING USER")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("** STOP LOCATING USER")

    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view == mapView.userLocation {
            return
        }
        
        print("Touch")
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("deselect")
    }
    

}

