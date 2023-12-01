//
//  KnownErrors.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Foundation

enum KnownErrors {
    case decodingDataError
    case expiredToken
    case validationError(message: String)
    
    var error: APIError {
        switch self {
        case .decodingDataError:
            return APIError(
                errorCode: "Decoding Data Error - 1",
                message: "Could not decode data"
            )
        case .expiredToken:
            return APIError(
                errorCode: "Token Expired Error - 2",
                message: "Token is expired"
            )
        case .validationError(let message):
            return APIError(
                errorCode: "Validation Error - 3",
                message: message)
        }
    }
}
