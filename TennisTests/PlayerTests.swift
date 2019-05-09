import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {
    
    private var player: Player!
    
    override func setUp() {
        player = Player.init("PlayerOne")
    }

    func test_ShouldReturnPlayerName_WhenPlayerIsInitialized() {
        
        XCTAssertEqual("PlayerOne", player.name())
    }
    
    func test_ShouldUpdateScore_WhenPlayerWinsAPoint() {
        player.updateScore()
        
        XCTAssertEqual(1, player.currentScore())
    }
    
    func test_ShouldReturnTranslateScoreWithTennisPointRepresentation_WhenPlayerWinsAPoint() {
        player.updateScore()
        
        XCTAssertEqual("15", player.translateScore())
    }
}
