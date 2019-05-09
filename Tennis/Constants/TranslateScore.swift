enum TranslateScore: String {
    case Love = "0"
    case Fifteen = "15"
    case Thirty = "30"
    case Fourty = "40"
    case Advantage = "AD"
    
    static func asString(_ translateScore: TranslateScore) -> String {
        return translateScore.rawValue
    }
}
