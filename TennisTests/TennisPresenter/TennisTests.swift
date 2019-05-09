import XCTest
@testable import Tennis

class TennisTests: XCTestCase {
    private var tennisView: SPY_TennisView!
    private var tennisPresenter: TennisPresenter!

    override func setUp() {
        tennisView = SPY_TennisView()
        tennisPresenter = buildTennisGame(tennisView)
    }

    func test_ShouldReturnLoveAll_WhenPlayerStartsTheGame() {
        
        XCTAssertEqual(TestScores.asString(.LoveAll), tennisView.gameScore())
    }
    
    func test_ShouldReturnFifteenEach_WhenEachPlayerScoresSinglePoint() {
        tennisPresenter.scoresPoint(.FirstPlayer)
        tennisPresenter.scoresPoint(.SecondPlayer)
        
        XCTAssertEqual(TestScores.asString(.FifteenEach), tennisView.gameScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanFourty() {
        winConsecutivePointsForFirstPlayer(3, tennis: tennisPresenter)
        winConsecutivePointsForSecondPlayer(4, tennis: tennisPresenter)
        tennisPresenter.scoresPoint(.FirstPlayer)
        
        XCTAssertEqual(TestScores.asString(.Deuce),tennisView.gameScore())
    }
    
    func test_ShouldReturnAdvantageForFirstPlayer_WhenPlayerScoresOnePointAfterDeuce() {
        winConsecutivePointsForFirstPlayer(3, tennis: tennisPresenter)
        winConsecutivePointsForSecondPlayer(3, tennis: tennisPresenter)
        tennisPresenter.scoresPoint(.FirstPlayer)
        
        XCTAssertEqual(TestScores.asString(.FirstPlayerAdvantage),tennisView.gameScore())
    }
    
    func test_ShouldReturnPlayerHasWon_WhenPlayerScoresMoreThanFourtyAndDifferenceIsMoreThanOne() {
        winConsecutivePointsForFirstPlayer(3, tennis: tennisPresenter)
        winConsecutivePointsForSecondPlayer(5, tennis: tennisPresenter)
        
        XCTAssertEqual(TestScores.asString(.SecondPlayerWon),tennisView.gameScore())
    }
    
    func test_ShouldNotIncreaseTheScore_WhenOneOfThePlayerHasWonTheMatch() {
        winConsecutivePointsForFirstPlayer(3, tennis: tennisPresenter)
        winConsecutivePointsForSecondPlayer(5, tennis: tennisPresenter)
        winConsecutivePointsForFirstPlayer(4, tennis: tennisPresenter)
        
        XCTAssertEqual(TestScores.asString(.SecondPlayerWon),tennisView.gameScore())
    }
    
    private func buildTennisGame(_ tennisView: TennisView) -> TennisPresenter {
        let firstPlayer = Player.init("FirstPlayer")
        let secondPlayer = Player.init("SecondPlayer")
        
        return TennisPresenter.init(firstPlayer, secondPlayer, tennisView)
    }
    
    private func winConsecutivePointsForFirstPlayer(_ numberOfTimes: Int, tennis: TennisPresenter) {
        for _ in 1 ... numberOfTimes {
            tennis.scoresPoint(.FirstPlayer)
        }
    }
    
    private func winConsecutivePointsForSecondPlayer(_ numberOfTimes: Int, tennis: TennisPresenter) {
        for _ in 1 ... numberOfTimes {
            tennis.scoresPoint(.SecondPlayer)
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
    case SecondPlayerWon = "SecondPlayer Won"
    
    static func asString(_ testScores: TestScores) -> String {
        return testScores.rawValue
    }
}

