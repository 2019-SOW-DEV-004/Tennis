import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    
    private var tennisView: SPY_TennisView!

    override func setUp() {
        tennisView = SPY_TennisView()
    }

    func test_ShouldReturnLoveAll_WhenPlayerStartsTheGame() {
        let _ = buildTennisGame()
        
        XCTAssertEqual("0 - 0", tennisView.gameScore())
    }
    
    func test_ShouldReturnFifteenEach_WhenEachPlayerScoresSinglePoint() {
        let tennis = buildTennisGame()
        
        tennis.scoresPoint(.firstPlayer)
        tennis.scoresPoint(.secondPlayer)
        
        XCTAssertEqual("15 - 15", tennisView.gameScore())
    }
    
    private func buildTennisGame() -> Tennis {
        let firstPlayer = Player.init("FirstPlayer")
        let secondPlayer = Player.init("SecondPlayer")
        
        return Tennis.init(firstPlayer, secondPlayer, tennisView)
    }
}

fileprivate class SPY_TennisView: TennisView {
    private var playersGameScore = "0 - 0"
    
    func displayScore(_ playersGameScore: String) {
        self.playersGameScore = playersGameScore
    }
    
    func gameScore() -> String {
        return playersGameScore
    }
}

