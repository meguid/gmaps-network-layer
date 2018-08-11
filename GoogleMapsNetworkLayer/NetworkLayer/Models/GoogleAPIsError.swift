//
//  GoogleAPIsError.swift
//  GoogleMapsNetworkLayer
//
//  Created by Ahmed Abdel Meguid on 8/11/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//
import Foundation

class GoogleAPIsError: Codable {
    
    var errorMessage: String?
    var status: String
    
    init() {
        self.errorMessage = "Unspecified Error Happend"
        status = "UNDEFINED_ERROR"
    }
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
        status = "LOCAL_ERROR"
    }
    
    enum CodingKeys: String, CodingKey {
        case errorMessage = "error_message"
        case status
    }
}
