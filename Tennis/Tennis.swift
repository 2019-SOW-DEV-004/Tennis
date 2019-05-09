class Tennis {
    private let firstPlayer: Player
    private let secondPlayer: Player
    private unowned let tennisView: TennisView
    
    private var isGameOver = false
    
    init(_ firstPlayer: Player, _ secondPlayer: Player, _ tennisView: TennisView) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.tennisView = tennisView
    }
    
    func scoresPoint(_ currentPlayer: CurrentPlayer)
    {
        if(isGameOver) {
            return
        }
        
        updatePlayersScore(currentPlayer)
        
        translatePlayersScore()
    }
    
    private func updatePlayersScore(_ currentPlayer: CurrentPlayer) {
        switch currentPlayer {
        case .firstPlayer:
            firstPlayer.updateScore()
        case .secondPlayer:
            secondPlayer.updateScore()
        }
    }
    
    private func translatePlayersScore() {
        if isWinner() {
            isGameOver = true
            tennisView.displayScore(highestScorePlayerName() + " " + TennisStatus.Won.rawValue)
            return
        }
        
        if isAdvantage() {
            tennisView.displayScore(TranslateScore.asString(.Advantage) + " " + highestScorePlayerName())
            return
        }
        
        if isDeuce() {
            tennisView.displayScore(TennisStatus.Deuce.rawValue)
            return
        }
        
        tennisView.displayScore(self.firstPlayer.translateScore() + " - " + self.secondPlayer.translateScore())
    }
    
    //Mark: Helper Methods
    private func isWinner() -> Bool {
        return hasPlayersScoredMoreThanFourtyPoints() && pointDifferenceBetweenPlayers() > 1
    }
    
    private func isAdvantage() -> Bool {
        return hasPlayersScoredMoreThanFourtyPoints() && pointDifferenceBetweenPlayers() == 1
    }
    
    private func isDeuce() -> Bool {
        return firstPlayer.currentScore() == secondPlayer.currentScore() && hasPlayersScoredMoreThanFourtyPoints()
    }
    
    private func hasPlayersScoredMoreThanFourtyPoints() -> Bool {
        return firstPlayer.hasScoredMoreThanFourtyPoints() || secondPlayer.hasScoredMoreThanFourtyPoints()
    }
    
    private func pointDifferenceBetweenPlayers() -> Int {
        return abs(firstPlayer.currentScore() - secondPlayer.currentScore())
    }
    
    private func highestScorePlayerName() -> String {
        if firstPlayer.currentScore() > secondPlayer.currentScore() {
            return firstPlayer.name()
        }
        
        return secondPlayer.name()
    }
}
