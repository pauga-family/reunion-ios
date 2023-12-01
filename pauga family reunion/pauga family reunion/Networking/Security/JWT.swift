//
//  JWT.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

struct JWT {
    // The JWT string.
    var token: String?
    
    // Extract the payload as a string.
    var payload: String? {
        guard let token = token else {
            return nil
        }
        
        let parts = token.components(separatedBy: ".")
        guard parts.count > 2 else {
            // JWT is in wrong format
            return nil
        }
        
        return decodeBase64(parts[1])
    }

    // Initialize the JWT struct with a token.
    init(token: String? = nil) {
        self.token = token
    }
    
    private func decodeBase64(_ string: String) -> String? {
        var base64 = string
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        while base64.count % 4 != 0 {
            base64.append("=")
        }
        
        guard let data = Data(base64Encoded: base64) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}
