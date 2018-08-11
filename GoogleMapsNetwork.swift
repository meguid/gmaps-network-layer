//
//  GoogleMapsNetwork.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import Foundation
import Moya

enum GoogleMapsNetwork {
    case getDirections(origin : LocationRequest, destination : LocationRequest, waypoints : WaypointsRequest?, mode: TravelMode?, alternatives: Bool?, avoid: RouteRestriction?, units: UnitSystem?, trafficModel: TrafficModel?)
}

extension GoogleMapsNetwork: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://maps.googleapis.com/maps/api")!
    }
    
    var path: String {
        switch self {
        case .getDirections:
            return "/directions/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDirections:
            return .get
        }
    }
    
    var task: Task {
        
        switch self {
        case .getDirections(let origin, let destination, let waypoints,
                            let mode, let alternatives, let avoid, let units, let trafficModel):

            let parameters: [String : Any] = [
                "key": GMapsAPIKey,
                "origin": origin.value,
                "destination": destination.value,
                "waypoints": waypoints?.value ?? "",
                "mode": mode?.rawValue ?? "driving",
                "alternatives": alternatives ?? false,
                "avoid": avoid?.rawValue ?? "",
                "units": units?.rawValue ?? "",
                "traffic_model" : trafficModel ?? ""]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
