//
//  KeychainService.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 11/26/23.
//

import Security
import Foundation

public class KeychainService {
    public class func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String : data
        ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    public class func load(key: String) -> Data? {
        let query = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String : kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
        ] as [String : Any]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
}
