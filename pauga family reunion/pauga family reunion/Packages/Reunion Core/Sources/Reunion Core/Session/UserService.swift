//
//  UserService.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 12/8/23.
//

import Foundation
import Synchronization

public protocol UserServicable: Sendable {
    func logUserOut()
    func getCurrentUser() -> UserModel?
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
}

public final class UserService : UserServicable {
    public static let shared = UserService()

    /// Mutable state, guarded by a `Mutex` so the service is `Sendable`
    /// under Core's Swift 6 language mode.
    private struct State {
        var user: UserModel? = nil
        var token: String?
        let client: APIClientProtocol = APIClient()
    }
    
    private let state = Mutex(State())

    private init() {
        setCurrentUser(userLoginModel: debugUser())
    }

    public func logUserOut() {
        state.withLock { $0.user = nil }
    }

    public func getCurrentUser() -> UserModel? {
        return state.withLock { $0.user }
    }

    func debugUser() -> UserLoginModel {
        return UserLoginModel(token: "", id: 1, firstName: "Justin", lastName: "Pauga", email: "paugajt@gmail.com")
    }

    public func signUp(firstName: String, lastName: String, email: String, password: String) async throws {
        let endpoint = AuthAPIProvider.createUser(email: email, firstName: firstName, lastName: lastName, password: password)
        let userLoginModel = debugUser() //try await client.request(endpoint: endpoint, responseModel: UserLoginModel.self)
        setToken(token: userLoginModel.token)
        setCurrentUser(userLoginModel: userLoginModel)
    }

    public func signIn(email: String, password: String) async throws {
        let endpoint = AuthAPIProvider.signIn(email: email, password: password)
        let userLoginModel = debugUser() //try await client.request(endpoint: endpoint, responseModel: UserLoginModel.self)
        setToken(token: userLoginModel.token)
        setCurrentUser(userLoginModel: userLoginModel)
    }

    // MARK: - Private
    private func setCurrentUser(userLoginModel: UserLoginModel) {
        let user = UserModel(with: userLoginModel)
        state.withLock { $0.user = user }
    }

    private func setToken(token: String) {
        let jwtData = token.data(using: String.Encoding.utf8)!
        let saveStatus = KeychainService.save(key: "userJWT", data: jwtData)

        if saveStatus == errSecSuccess {
            print("Stored token successfully")
        } else {
            print("Failed to store token")
        }
    }

    private func fetchToken() -> String? {
        guard let tokenData = KeychainService.load(key: "userJWT") else {
            return nil
        }

        return String(data: tokenData, encoding: .utf8)
    }
}
