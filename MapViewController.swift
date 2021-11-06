//
//  MapViewController.swift
//  Rumson School District
//
//  Created by Brad Miller on 7/31/17.
//  Copyright © 2017 Brad Miller. All rights reserved.
//

import UIKit

import MapKit

import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var Map: MKMapView!
    
    var location = CLGeocoder()
    
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Map.mapType = .hybrid
        Map.delegate = self
        location.geocodeAddressString(address) { (Placemarks, error) in
            if error != nil{
                print("error")
            }
            else {
                if let Placemark = Placemarks?.first{
                    let mapPlacemark = MKPlacemark(placemark: Placemark)
                    self.Map.addAnnotation(mapPlacemark)
                    self.Map.showAnnotations([mapPlacemark], animated: true)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            pinView?.canShowCallout = true
        }
        if annotation is MKUserLocation{
            return nil
        }
        let directionsButton = UIButton(type: .detailDisclosure)
        pinView?.rightCalloutAccessoryView = directionsButton
        return pinView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let alert = UIAlertController(title: "Directions", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            guard let encodedAddress = self.address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed) else {return}
            guard let url = URL(string: "http://maps.apple.com/?daddr=\(encodedAddress)&dirflg=d&t=s")else {return}
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
