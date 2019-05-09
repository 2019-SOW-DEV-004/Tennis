class Player {
    private let playerName: String
    
    init(_ playerName: String) {
        self.playerName = playerName
    }
    
    func name() -> String {
        return playerName
    }
}
