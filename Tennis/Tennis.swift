class Tennis {
    private let firstPlayer: Player
    private let secondPlayer: Player
    
    init(_ firstPlayer: Player, _ secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func scoresPoint(_ currentPlayer: CurrentPlayer)
    {
        switch currentPlayer {
        case .firstPlayer:
            firstPlayer.updateScore()
        case .secondPlayer:
            secondPlayer.updateScore()
        }
    }
    
    func getPlayersScore() -> String {
        return self.firstPlayer.translateScore() + " - " + self.secondPlayer.translateScore()
    }
}
