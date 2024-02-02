//
//  UserService.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/8/23.
//

import Foundation

protocol UserServicable {
    func logUserOut()
    func getCurrentUser() -> UserModel?
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
}

class UserService : UserServicable {
    static var shared = UserService()
    private var user: UserModel? = nil
    private var token: String?
    private let client: APIClientProtocol = APIClient()
    
    private init() {}
    
    func logUserOut() {
        self.user = nil
    }
    
    func getCurrentUser() -> UserModel? {
        return user
    }
    
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws {
        let endpoint = AuthAPIProvider.createUser(email: email, firstName: firstName, lastName: lastName, password: password)
        let userLoginModel = try await client.request(endpoint: endpoint, responseModel: UserLoginModel.self)
        setToken(token: userLoginModel.token)
        setCurrentUser(userLoginModel: userLoginModel)
    }
    
    func signIn(email: String, password: String) async throws {
        let endpoint = AuthAPIProvider.signIn(email: email, password: password)
        let userLoginModel = try await client.request(endpoint: endpoint, responseModel: UserLoginModel.self)
        setToken(token: userLoginModel.token)
        setCurrentUser(userLoginModel: userLoginModel)
    }
    
    // MARK: - Private
    private func setCurrentUser(userLoginModel: UserLoginModel) {
        self.user = UserModel(with: userLoginModel)
    }
    
    private func setToken(token: String) {
        let jwtData = token.data(using: String.Encoding.utf8)!
        let saveStatus = KeychainManager.save(key: "userJWT", data: jwtData)
        
        if saveStatus == errSecSuccess {
            print("Stored token successfully")
        } else {
            print("Failed to store token")
        }
    }
    
    private func fetchToken() -> String? {
        guard let tokenData = KeychainManager.load(key: "userJWT") else {
            return nil
        }
        
        return String(data: tokenData, encoding: .utf8)
    }
}
