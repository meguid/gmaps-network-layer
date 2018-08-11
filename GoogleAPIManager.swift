//
//  GoogleAPIManager.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//
import Foundation
import Moya

class GoogleAPIManager {

    static func callAPI(endpoint: GoogleMapsNetwork, completionHandler: @escaping (Data) -> Void, failHandler: @escaping (GoogleAPIsError) -> Void) {
        MoyaProvider<GoogleMapsNetwork>().request(endpoint) { result in
            switch result {
            case let .success(response):
                if (200 ... 299).contains(response.statusCode) {
                    completionHandler(response.data)
                } else {
                    guard let error = try? JSONDecoder().decode(GoogleAPIsError.self, from: response.data) else {
                        failHandler(GoogleAPIsError())
                        return
                    }
                    failHandler(error)
                }
            case .failure:
                if Network.checkConnection() {
                    failHandler(GoogleAPIsError(errorMessage: "Connection Timed Out"))
                } else {
                    failHandler(GoogleAPIsError(errorMessage: "There's no internet connection"))
                }
            }
        }
    }
}
