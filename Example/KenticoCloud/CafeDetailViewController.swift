//
//  CafeDetailViewController.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 17/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import  MapKit

class CafeDetailViewController: UIViewController {

    var cafe: Cafe?
    var image: UIImage?
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var firstRowAddress: UILabel!
    @IBOutlet weak var secondRowAddress: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var map: MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let cafe = cafe {
            setTitles(cafe: cafe)
            setMap(cafe: cafe)
        }
        
        setImages()
    }
    
    private func setTitles(cafe: Cafe) {
        title = cafe.city
        city.text = cafe.city
        firstRowAddress.text = cafe.street
        secondRowAddress.text = cafe.state
        phone.text = cafe.phone
    }
    
    private func setMap(cafe: Cafe) {
        let address = "\(cafe.street ?? "")  \(cafe.state ?? "") \(cafe.country ?? "")  \(cafe.zip ?? "")"
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            
            let pinPoint = MKPointAnnotation()
            pinPoint.coordinate = location.coordinate
            print(location.coordinate)
            self.map?.addAnnotation(pinPoint)

            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            self.map?.setRegion(region, animated: true)
        }
    }
    
    private func setImages() {
        if (photo) != nil {
            self.photo.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
