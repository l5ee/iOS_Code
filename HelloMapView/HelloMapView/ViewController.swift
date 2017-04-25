//
//  ViewController.swift
//  HelloMapView
//
//  Created by l5ee on 2017/4/20.
//  Copyright © 2017年 l5ee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    
    
    
    @IBAction func addMeAnnotation(_ sender: UILongPressGestureRecognizer) {
        let touchPoint = sender.location(in: map)
        let touchCoordinate:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "One dat i wanna be here"
        map.addAnnotation(annotation)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude: CLLocationDegrees = 30.550262
        let longtitude: CLLocationDegrees = 104.043246
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        let xScale:CLLocationDegrees = 0.01
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(yScale, xScale)
        let regin:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(regin, animated: true)
//        map.mapType = .satelliteFlyover
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

