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
}
