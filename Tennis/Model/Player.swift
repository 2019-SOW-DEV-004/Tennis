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
        case 0:
            return TranslateScore.Love.rawValue
        case 1:
            return TranslateScore.Fifteen.rawValue
        case 2:
            return TranslateScore.Thirty.rawValue
        case 3:
            return TranslateScore.Fourty.rawValue
        default:
            return TranslateScore.Advantage.rawValue
        }
    }
    
    func hasScoredMoreThanFourtyPoints() -> Bool {
        return score > 3
    }
}
