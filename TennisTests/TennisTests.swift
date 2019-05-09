import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    private var tennisView: SPY_TennisView!

    override func setUp() {
        tennisView = SPY_TennisView()
    }

    func test_ShouldReturnLoveAll_WhenPlayerStartsTheGame() {
        let _ = buildTennisGame()
        
        XCTAssertEqual(TestScores.asString(.LoveAll), tennisView.gameScore())
    }
    
    func test_ShouldReturnFifteenEach_WhenEachPlayerScoresSinglePoint() {
        let tennis = buildTennisGame()
        
        tennis.scoresPoint(.firstPlayer)
        tennis.scoresPoint(.secondPlayer)
        
        XCTAssertEqual(TestScores.asString(.FifteenEach), tennisView.gameScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanFourty() {
        let tennis = buildTennisGame()
        
        winConsecutivePointsForFirstPlayer(3, tennis: tennis)
        winConsecutivePointsForSecondPlayer(4, tennis: tennis)
        tennis.scoresPoint(.firstPlayer)
        
        XCTAssertEqual(TestScores.asString(.Deuce),tennisView.gameScore())
    }
    
    func test_ShouldReturnAdvantageForFirstPlayer_WhenPlayerScoresOnePointAfterDeuce() {
        let tennis = buildTennisGame()

        self.winConsecutivePointsForFirstPlayer(3, tennis: tennis)
        self.winConsecutivePointsForSecondPlayer(3, tennis: tennis)
        tennis.scoresPoint(.firstPlayer)
        
        XCTAssertEqual(TestScores.asString(.FirstPlayerAdvantage),tennisView.gameScore())
    }
    
    private func buildTennisGame() -> Tennis {
        let firstPlayer = Player.init("FirstPlayer")
        let secondPlayer = Player.init("SecondPlayer")
        
        return Tennis.init(firstPlayer, secondPlayer, tennisView)
    }
    
    private func winConsecutivePointsForFirstPlayer(_ numberOfTimes: Int, tennis: Tennis) {
        for _ in 1 ... numberOfTimes {
            tennis.scoresPoint(.firstPlayer)
        }
    }
    
    private func winConsecutivePointsForSecondPlayer(_ numberOfTimes: Int, tennis: Tennis) {
        for _ in 1 ... numberOfTimes {
            tennis.scoresPoint(.secondPlayer)
        }
    }
}

fileprivate class SPY_TennisView: TennisView {
    private var playersGameScore = TestScores.LoveAll.rawValue
    
    func displayScore(_ playersGameScore: String) {
        self.playersGameScore = playersGameScore
    }
    
    func gameScore() -> String {
        return playersGameScore
    }
}

fileprivate enum TestScores: String {
    case LoveAll = "0 - 0"
    case FifteenEach = "15 - 15"
    case Deuce = "Deuce"
    case FirstPlayerAdvantage = "AD FirstPlayer"
    
    static func asString(_ testScores: TestScores) -> String {
        return testScores.rawValue
    }
}

