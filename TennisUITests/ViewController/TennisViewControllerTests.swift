import XCTest

class TennisViewControllerTests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
    }
    
    func test_ShouldReturnFifteenAll_WhenPlayersScoreOnePointEach() {
        let app = XCUIApplication()
        app.buttons["player1Scores"].tap()
        app.buttons["player2Scores"].tap()
        
        let score = app.staticTexts["15 - 15"]
        
        XCTAssertTrue(score.exists)
    }
    
    func test_ShouldReturnDefaultPoints_WhenRestartIsSelected() {
        let app = XCUIApplication()
        app.buttons["restart"].tap()
        
        let score = app.staticTexts["Love All"]
        XCTAssertTrue(score.exists)
    }
}
