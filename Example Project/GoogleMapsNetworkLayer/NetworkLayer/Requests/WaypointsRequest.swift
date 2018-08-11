//
//  WaypointsRequest.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import Foundation

class WaypointsRequest {
    
    var value: String
    
    init(waypoints: [LocationRequest]) {
        self.value = "optimize:true"
        for waypoint in waypoints {
            self.value += "|\(waypoint.value)"
        }
    }
}
