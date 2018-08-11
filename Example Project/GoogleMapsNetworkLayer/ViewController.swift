//
//  ViewController.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GoogleAPIManager.callAPI(endpoint: .getDirections(origin: LocationRequest(latitude: 30.1, longitude: 30.1), destination: LocationRequest(latitude: 30.1, longitude: 30.11), waypoints: nil, mode: nil, alternatives: nil, avoid: nil, units: nil, trafficModel: nil), completionHandler: { (jsonData) in
            
            guard let directionsResponse = try? JSONDecoder().decode(Directions.self, from: jsonData) else {
                print("FAIL")
                return
            }
            
            print(directionsResponse)
            
        }) { (error) in
            print(error.status)
        }
        
    }
}

