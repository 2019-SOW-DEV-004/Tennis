import XCTest
@testable import Tennis

class TennisTests: XCTestCase {

    func test_ShouldReturnLoveAll_WhenPlayerStartsTheGame() {
        let firstPlayer = Player.init("FirstPlayer")
        let secondPlayer = Player.init("SecondPlayer")
        let tennis = Tennis.init(firstPlayer, secondPlayer)
        
        XCTAssertEqual("0 - 0", tennis.getPlayersScore())
    }
}
