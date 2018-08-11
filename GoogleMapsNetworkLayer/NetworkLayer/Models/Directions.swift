import Foundation

class Directions: Codable {
    let geocodedWaypoints: [GeocodedWaypoint]?
    let routes: [Route]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes, status
    }
    
    init(geocodedWaypoints: [GeocodedWaypoint]?, routes: [Route]?, status: String?) {
        self.geocodedWaypoints = geocodedWaypoints
        self.routes = routes
        self.status = status
    }
}

class GeocodedWaypoint: Codable {
    let geocoderStatus, placeID: String?
    let types: [String]?
    
    enum CodingKeys: String, CodingKey {
        case geocoderStatus = "geocoder_status"
        case placeID = "place_id"
        case types
    }
    
    init(geocoderStatus: String?, placeID: String?, types: [String]?) {
        self.geocoderStatus = geocoderStatus
        self.placeID = placeID
        self.types = types
    }
}

class Route: Codable {
    let bounds: Bounds?
    let copyrights: String?
    let legs: [Leg]?
    let overviewPolyline: Polyline?
    let summary: String?
    let waypointOrder: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case bounds, copyrights, legs
        case overviewPolyline = "overview_polyline"
        case summary
        case waypointOrder = "waypoint_order"
    }
    
    init(bounds: Bounds?, copyrights: String?, legs: [Leg]?, overviewPolyline: Polyline?, summary: String?, waypointOrder: [Int]?) {
        self.bounds = bounds
        self.copyrights = copyrights
        self.legs = legs
        self.overviewPolyline = overviewPolyline
        self.summary = summary
        self.waypointOrder = waypointOrder
    }
}

class Bounds: Codable {
    let northeast, southwest: Coordinates?
    
    init(northeast: Coordinates?, southwest: Coordinates?) {
        self.northeast = northeast
        self.southwest = southwest
    }
}

class Coordinates: Codable {
    let lat, lng: Double?
    
    init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}

class Leg: Codable {
    let distance, duration: Distance?
    let endAddress: String?
    let endLocation: Coordinates?
    let startAddress: String?
    let startLocation: Coordinates?
    let steps: [Step]?
    
    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endAddress = "end_address"
        case endLocation = "end_location"
        case startAddress = "start_address"
        case startLocation = "start_location"
        case steps
    }
    
    init(distance: Distance?, duration: Distance?,
         endAddress: String?, endLocation: Coordinates?,
         startAddress: String?, startLocation: Coordinates?, steps: [Step]?) {
        self.distance = distance
        self.duration = duration
        self.endAddress = endAddress
        self.endLocation = endLocation
        self.startAddress = startAddress
        self.startLocation = startLocation
        self.steps = steps
    }
}

class Distance: Codable {
    let text: String?
    let value: Int?
    
    init(text: String?, value: Int?) {
        self.text = text
        self.value = value
    }
}

class Step: Codable {
    let distance, duration: Distance?
    let endLocation: Coordinates?
    let htmlInstructions: String?
    let polyline: Polyline?
    let startLocation: Coordinates?
    let maneuver: String?
    
    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endLocation = "end_location"
        case htmlInstructions = "html_instructions"
        case polyline
        case startLocation = "start_location"
        case maneuver
    }
    
    init(distance: Distance?, duration: Distance?, endLocation: Coordinates?,
         htmlInstructions: String?, polyline: Polyline?, startLocation: Coordinates?, maneuver: String?) {
        self.distance = distance
        self.duration = duration
        self.endLocation = endLocation
        self.htmlInstructions = htmlInstructions
        self.polyline = polyline
        self.startLocation = startLocation
        self.maneuver = maneuver
    }
}

class Polyline: Codable {
    let points: String?
    
    init(points: String?) {
        self.points = points
    }
}
