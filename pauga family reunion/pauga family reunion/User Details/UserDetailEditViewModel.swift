//
//  UserDetailViewModel.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 5/6/24.
//

import Foundation

final class UserDetailEditViewModel : ObservableObject {
    // MARK: - Published Variables
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var title: String
    @Published var location: String
    @Published var biography: String
    @Published var readOnly: Bool
    
    // MARK: - Private Variables
    private let userService: UserServicable = UserService.shared
    
    init(user: UserModel?) {
        self.firstName = user?.firstName ?? ""
        self.lastName = user?.lastName ?? ""
        self.email = user?.email ?? ""
        self.title = user?.title ?? ""
        self.location = user?.location ?? ""
        self.biography = user?.biography ?? ""
        readOnly = userService.getCurrentUser() != user
    }
}
