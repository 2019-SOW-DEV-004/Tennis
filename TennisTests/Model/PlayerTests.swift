import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {
    
    private var player: Player!
    
    override func setUp() {
        player = Player.init("FirstPlayer")
    }

    func test_ShouldReturnPlayerName_WhenPlayerIsInitialized() {
        
        XCTAssertEqual("FirstPlayer", player.name())
    }
    
    func test_ShouldUpdateScore_WhenPlayerWinsAPoint() {
        player.updateScore()
        
        XCTAssertEqual(Score.Fifteen, player.currentScore())
    }
    
    func test_ShouldReturnTranslateScoreWithTennisPointRepresentation_WhenPlayerWinsAPoint() {
        player.updateScore()
        
        XCTAssertEqual(TranslateScore.asString(.Fifteen), player.translateScore())
    }
}
