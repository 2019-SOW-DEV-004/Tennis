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
            return TranslateScore.Love.rawValue
        case Score.Fifteen:
            return TranslateScore.Fifteen.rawValue
        case Score.Thirty:
            return TranslateScore.Thirty.rawValue
        case Score.Fourty:
            return TranslateScore.Fourty.rawValue
        default:
            return TranslateScore.Advantage.rawValue
        }
    }
    
    func hasScoredMoreThanFourtyPoints() -> Bool {
        return score > Score.Fourty
    }
}
