# GoogleMapsNetworkLayer

A **`Google Maps`** APIs network layer using **`Moya`**

## Features:

- [x] [Google Maps Directions API](https://developers.google.com/maps/documentation/directions)
- [ ] [Google Distance Matrix API](https://developers.google.com/maps/documentation/distance-matrix)
- [ ] [Google Places API](https://developers.google.com/places/web-service)
- [ ] [More...](https://developers.google.com/maps/documentation)

## Requirements
- [x] iOS 9.0+ / Mac OS X 10.11+ / tvOS 9.0+ / watchOS 2.0+
- [x] Xcode 8.0+
- [x] Swift 3.0+


## Installation

### [CocoaPods](http://cocoapods.org)
- You need to install Moya for network calls

  ```ruby
  pod 'Moya', '~> 11.0'
  ```
  
## Usage
- Simple Google Directions Call

  ```swift
  GoogleAPIManager.callAPI(endpoint: .getDirections(
                                      origin: LocationRequest(latitude: 30.1, longitude: 30.1),
                                      destination: LocationRequest(latitude: 30.1, longitude: 30.11),
                                      waypoints: nil,
                                      mode: nil,
                                      alternatives: nil,
                                      avoid: nil,
                                      units: nil,
                                      trafficModel: nil),
                                      completionHandler: { (jsonData) in
            
            guard let directionsResponse = try? JSONDecoder().decode(Directions.self, from: jsonData) 
            else {
                return
            }
                        
  }) { (error) in
      print(error.status)
  }
  ```
  
- Handling the API Response

  ```swift
  GoogleAPIManager.callAPI(endpoint: .getDirections(
                                      origin: LocationRequest(latitude: 30.1, longitude: 30.1),
                                      destination: LocationRequest(latitude: 30.1, longitude: 30.11),
                                      waypoints: nil,
                                      mode: nil,
                                      alternatives: nil,
                                      avoid: nil,
                                      units: nil,
                                      trafficModel: nil),
                                      completionHandler: { (jsonData) in
            
            guard let directionsResponse = try? JSONDecoder().decode(Directions.self, from: jsonData) 
            else {
                return
            }
            
            if let duration = directionsResponse.routes?[0].legs?[0].duration?.text {
                print("Your trip duration is \(duration)")
            }
                                    
            if let distance = directionsResponse.routes?[0].legs?[0].distance?.text {
                print("Your trip distance is \(distance)")
            }
                        
  }) { (error) in
      print(error.status)
  }
  ```  
  
- Calling Directions with Address or PlaceID

  ```swift
  GoogleAPIManager.callAPI(endpoint: .getDirections(
                                      origin: LocationRequest(address: "Disneyland"),
                                      destination: LocationRequest(placeID: "ChIJv9pM_8pHWBQRE7aKgiXuPiI"),
                                      .
                                      .
                                      .

  ```
   
- Adding Waypoints

  ```swift
  var waypoints = [LocationRequest]()
  waypoints.append(LocationRequest(address: "Toronto"))
  waypoints.append(LocationRequest(latitude: -50.0, longitude: 30.1))
  waypoints.append(LocationRequest(placeID: "ChIJv9pM_8pHWBQRE7aKgiXuPiI"))
  ```     
  
  ```swift
  GoogleAPIManager.callAPI(endpoint: .getDirections(
                                      origin: LocationRequest(latitude: 30.1, longitude: 30.1),
                                      destination: LocationRequest(latitude: 30.1, longitude: 30.11),
                                      waypoints: WaypointsRequest(waypoints: waypoints),
                                      mode: nil,
                                      alternatives: nil,
                                      avoid: nil,
                                      units: nil,
                                      trafficModel: nil),
                                      completionHandler: { (jsonData) in
            
            guard let directionsResponse = try? JSONDecoder().decode(Directions.self, from: jsonData) 
            else {
                return
            }
                        
  }) { (error) in
      print(error.status)
  }
  ```
     
- Adding more parameters
  - Travel Mode

    ```swift
    enum TravelMode: String {
    case driving
    case walking
    case bicycling
    case transit
    }
    ```

    ```swift
    GoogleAPIManager.callAPI(endpoint: .getDirections(
                                        .
                                        .
                                        .
                                        mode: .bicycling,
                                        .
                                        .
                                        .
    ```
  - Route Restriction

    ```swift
    enum RouteRestriction: String {
    case tolls
    case highways
    case ferries
    case indoor
    }
    ```

    ```swift
    GoogleAPIManager.callAPI(endpoint: .getDirections(
                                        .
                                        .
                                        .
                                        avoid: .highways,
                                        .
                                        .
                                        .
    ```
  - Traffic Model

    ```swift
    enum TrafficModel: String {
    case best_guess
    case pessimistic
    case optimistic
    }
    ```

    ```swift
    GoogleAPIManager.callAPI(endpoint: .getDirections(
                                        .
                                        .
                                        .
                                        trafficModel: .pessimistic,
                                        .
                                        .
                                        .
    ```
  - Unit System

    ```swift
    enum UnitSystem: String {
    case metric
    case imperial
    }
    ```

    ```swift
    GoogleAPIManager.callAPI(endpoint: .getDirections(
                                        .
                                        .
                                        .
                                        units: .imperial,
                                        .
                                        .
                                        .
    ```
  

   
