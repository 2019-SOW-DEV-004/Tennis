import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {

    func test_ShouldReturnPlayerName_WhenPlayerIsInitialized() {
        let player = Player.init("PlayerOne")
        
        XCTAssertEqual("PlayerOne", player.name())
    }
    
    func test_ShouldUpdateScore_WhenPlayerWinsAPoint() {
        let player = Player.init("PlayerOne")
        
        player.updateScore()
        
        XCTAssertEqual(1, player.currentScore())
    }
}
