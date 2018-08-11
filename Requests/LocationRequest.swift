//
//  LocationRequest.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import Foundation


class LocationRequest {
    
    var value: String
    
    init(latitude: Double, longitude: Double) {
        self.value = "\(latitude),\(longitude)"
    }
    
    init(address: String) {
        self.value = address
    }
    
    init(placeID: String) {
        self.value = "place_id:\(placeID)"
    }
}
