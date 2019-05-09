import XCTest
@testable import Tennis

class TennisTests: XCTestCase {

    func test_ShouldReturnLoveAll_WhenPlayerStartsTheGame() {
        let tennis = buildTennisGame()
        
        XCTAssertEqual("0 - 0", tennis.getPlayersScore())
    }
    
    private func buildTennisGame() -> Tennis {
        let firstPlayer = Player.init("FirstPlayer")
        let secondPlayer = Player.init("SecondPlayer")
        
        return Tennis.init(firstPlayer, secondPlayer)
    }
}
