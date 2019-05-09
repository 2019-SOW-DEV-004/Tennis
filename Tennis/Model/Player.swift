class Player {
    private let playerName: String
    private var score: Int = 0
    
    init(_ playerName: String) {
        self.playerName = playerName
    }
    
    func name() -> String {
        return playerName
    }
    
    func updateScore() {
        score += 1
    }
    
    func currentScore() -> Int {
        return score
    }
    
    func translateScore() -> String {
        switch score {
        case Score.Love:
            return TranslateScore.asString(.Love)
        case Score.Fifteen:
            return TranslateScore.asString(.Fifteen)
        case Score.Thirty:
            return TranslateScore.asString(.Thirty)
        case Score.Fourty:
            return TranslateScore.asString(.Fourty)
        default:
            return TranslateScore.asString(.Advantage)
        }
    }
    
    func hasScoredMoreThanFourtyPoints() -> Bool {
        return score > Score.Fourty
    }
}
