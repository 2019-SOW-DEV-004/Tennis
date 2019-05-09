class Tennis {
    private let firstPlayer: Player
    private let secondPlayer: Player
    private unowned let tennisView: TennisView
    
    init(_ firstPlayer: Player, _ secondPlayer: Player, _ tennisView: TennisView) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.tennisView = tennisView
    }
    
    func scoresPoint(_ currentPlayer: CurrentPlayer)
    {
        switch currentPlayer {
        case .firstPlayer:
            firstPlayer.updateScore()
        case .secondPlayer:
            secondPlayer.updateScore()
        }
        
        displayPlayersScore()
    }
    
    private func displayPlayersScore() {
        tennisView.displayScore(self.firstPlayer.translateScore() + " - " + self.secondPlayer.translateScore())
    }
}
