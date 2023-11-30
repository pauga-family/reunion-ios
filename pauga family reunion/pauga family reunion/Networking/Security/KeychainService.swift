//
//  KeychainService.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Security
import Foundation

class KeychainService {
    class func save(token: String, account: String) {
        if let data = token.data(using: .utf8) {
            let query: [String : Any] = [kSecClass as String: kSecClassGenericPassword,
                                         kSecAttrAccount as String: account,
                                         kSecValueData as String: data]
            SecItemAdd(query as CFDictionary, nil)
        }
    }
    
    class func loadToken(account: String) -> String? {
        let query: [String : Any] = [kSecClass as String: kSecClassGenericPassword,
                                     kSecAttrAccount as String: account,
                                     kSecReturnData as String: kCFBooleanTrue!,
                                     kSecMatchLimit as String: kSecMatchLimitOne]
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            if let retrivedData = dataTypeRef as? Data,
               let result = String(data: retrivedData, encoding: .utf8) {
                return result
            }
        }
        return nil
    }
}


/*
 Save the token: 
    KeychainService.save(token: receivedToken, account: "myAccount")
 
 Load the token:
    if let savedToken = KeychainService.loadToken(account: "myAccount") {
        let jwt = JWT(token: savedToken)
        print(jwt.payload)
    }
 */
