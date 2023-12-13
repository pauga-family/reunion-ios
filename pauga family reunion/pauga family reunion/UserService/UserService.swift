//
//  UserService.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/8/23.
//

import Foundation

protocol UserServicable {
    func setCurrentUser(userLoginModel: UserLoginModel)
    func logUserOut()
    func getCurrentUser() -> UserModel?
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws
    func setToken(token: String)
}

class UserService : UserServicable {
    static var shared = UserService()
    private var user: UserModel?
    private let client: APIClientProtocol = APIClient()
    
    private init() {
        self.user = nil
    }
    
    func setCurrentUser(userLoginModel: UserLoginModel) {
        
    }
    
    func logUserOut() {
        
    }
    
    func getCurrentUser() -> UserModel? {
        return user
    }
    
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws {
        let endpoint = AuthAPIProvider.createUser(email: email, firstName: firstName, lastName: lastName, password: password)
        let userLoginModel = try await client.request(endpoint: endpoint, responseModel: UserLoginModel.self)
        setToken(token: userLoginModel.token)
        user = UserModel(with: userLoginModel)
    }
    
    func setToken(token: String) {
        let jwtData = token.data(using: String.Encoding.utf8)!
        let saveStatus = KeychainManager.save(key: "userJWT", data: jwtData)
        
        if saveStatus == errSecSuccess {
            print("Stored token successfully")
        } else {
            print("Failed to store token")
        }
    }
    
    func fetchToken() -> String? {
        guard let tokenData = KeychainManager.load(key: "userJWT") else {
            return nil
        }
        
        return String(data: tokenData, encoding: .utf8)
    }
}
