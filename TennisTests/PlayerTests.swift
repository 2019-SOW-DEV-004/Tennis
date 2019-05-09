import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {

    func test_ShouldReturnPlayerName_WhenPlayerIsInitialized() {
        let player = Player.init("PlayerOne")
        
        XCTAssertEqual("PlayerOne", player.name())
    }
}
