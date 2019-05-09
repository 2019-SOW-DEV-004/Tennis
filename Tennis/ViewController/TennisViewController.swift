import UIKit

class TennisViewController: UIViewController, TennisView {
    private var tennisGamePresenter: TennisPresenter!
    @IBOutlet weak var gameScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tennisGamePresenter = buildTennisGamePresenter()
    }
    
    @IBAction func restartGame(_ sender: Any) {
        tennisGamePresenter = buildTennisGamePresenter()
        updateScore(TennisStatus.asString(.LoveAll))
    }
    
    @IBAction func firstPlayerScores(_ sender: Any) {
        tennisGamePresenter.scoresPoint(.FirstPlayer)
    }
    
    @IBAction func secondPlayerScores(_ sender: Any) {
        tennisGamePresenter.scoresPoint(.SecondPlayer)
    }
    
    //Mark: Helper methods
    private func buildTennisGamePresenter() -> TennisPresenter? {
        let firstPlayer = Player("FirstPlayer")
        let secondPlayer = Player("SecondPlayer")
        
        return TennisPresenter.init(firstPlayer, secondPlayer, self)
    }
    
    private func updateScore(_ score: String) {
        self.gameScore.text = score
    }
    
    //Mark: Tennis View
    func displayScore(_ playersGameScore: String) {
        updateScore(playersGameScore)
    }
}
