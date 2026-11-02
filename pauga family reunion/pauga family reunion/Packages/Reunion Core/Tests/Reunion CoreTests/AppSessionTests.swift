import Testing
import Synchronization
@testable import Reunion_Core

private final class MockUserService: UserServicable {
    private let user = Mutex<UserModel?>(nil)
    private let loginUser = UserModel(id: 1, firstName: "Test", lastName: "User", email: "test@example.com", title: nil, location: nil, biography: nil)

    init(startLoggedIn: Bool) {
        if startLoggedIn { user.withLock { $0 = loginUser } }
    }

    func logUserOut() { user.withLock { $0 = nil } }
    func getCurrentUser() -> UserModel? { user.withLock { $0 } }
    func signUp(firstName: String, lastName: String, email: String, password: String) async throws {
        user.withLock { $0 = loginUser }
    }
    func signIn(email: String, password: String) async throws {
        user.withLock { $0 = loginUser }
    }
}

@MainActor
struct AppSessionTests {
    @Test func constructsWithDefaultUserService() {
        let session = AppSession()
        #expect(session.isLoggedIn == (UserService.shared.getCurrentUser() != nil))
    }

    @Test func startsLoggedOutWhenServiceHasNoUser() {
        let session = AppSession(userService: MockUserService(startLoggedIn: false))
        #expect(session.isLoggedIn == false)
        #expect(session.currentUser == nil)
    }

    @Test func signInUpdatesState() async throws {
        let session = AppSession(userService: MockUserService(startLoggedIn: false))
        try await session.signIn(email: "test@example.com", password: "password")
        #expect(session.isLoggedIn)
        #expect(session.currentUser?.email == "test@example.com")
    }

    @Test func signUpUpdatesState() async throws {
        let session = AppSession(userService: MockUserService(startLoggedIn: false))
        try await session.signUp(firstName: "Test", lastName: "User", email: "test@example.com", password: "password")
        #expect(session.isLoggedIn)
    }

    @Test func logOutClearsState() {
        let session = AppSession(userService: MockUserService(startLoggedIn: true))
        #expect(session.isLoggedIn)
        session.logOut()
        #expect(session.isLoggedIn == false)
        #expect(session.currentUser == nil)
    }
}
