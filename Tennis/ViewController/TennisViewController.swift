import UIKit

class TennisViewController: UIViewController, TennisView {
    private var tennisGamePresenter: TennisPresenter!
    @IBOutlet weak var gameStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tennisGamePresenter = buildTennisGamePresenter()
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
    
    func displayScore(_ playersGameScore: String) {
        self.gameStatus.text = playersGameScore
    }
}
