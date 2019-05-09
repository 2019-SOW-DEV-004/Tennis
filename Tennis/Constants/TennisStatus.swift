enum TennisStatus: String {
    case Deuce = "Deuce"
    case Won = "Won"
    
    static func asString(_ tennisStatus: TennisStatus) -> String {
        return tennisStatus.rawValue
    }
}
