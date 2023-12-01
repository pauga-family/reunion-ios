//
//  APIConfig.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

class APIConfig {
    static var shared = APIConfig()
    private init() {}
    
    var scheme: String {
        "http"
    }
    var baseURL: String {
        "127.0.0.1"
    }
    
    var token: JWT? {
        return nil
    }
}
