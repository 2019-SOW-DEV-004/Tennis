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
        
        checkGameStatus()
    }
    
    private func updatePlayersScore(_ currentPlayer: CurrentPlayer) {
        switch currentPlayer {
        case .FirstPlayer:
            firstPlayer.updateScore()
        case .SecondPlayer:
            secondPlayer.updateScore()
        }
    }
    
    private func checkGameStatus() {
        if isWinner() {
            isGameOver = true
            tennisView.displayScore(highestScorePlayerName() + " " + TennisStatus.asString(.Won))
            return
        }
        
        if isAdvantage() {
            tennisView.displayScore(TranslateScore.asString(.Advantage) + " " + highestScorePlayerName())
            return
        }
        
        if isDeuce() {
            tennisView.displayScore(TennisStatus.asString(.Deuce))
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
