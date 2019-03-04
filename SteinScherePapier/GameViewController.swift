//
//  ViewController.swift
//  SteinScherePapier
//
//  Created by Mario Rotz on 02.03.19.
//  Copyright © 2019 Mario Rotz. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scissorLabel : UILabel!
    @IBOutlet weak var paperLabel : UILabel!
    @IBOutlet weak var stoneLabel : UILabel!
    
    @IBOutlet weak var scissorButton : UIButton!
    @IBOutlet weak var paperButton : UIButton!
    @IBOutlet weak var stoneButton : UIButton!
    
    @IBOutlet weak var startNewGameButton : UIButton!
    @IBOutlet weak var resultView : UIView!
    @IBOutlet weak var resultLabel : UILabel!
    
    var player1 : Player = Player()
    var player2 : Player = Player()
    
    @IBAction func restartButton() {
        self.scissorButton.isUserInteractionEnabled=true
        self.paperButton.isUserInteractionEnabled=true
        self.stoneButton.isUserInteractionEnabled=true
        self.scissorButton.alpha = 1.0
        self.paperButton.alpha = 1.0
        self.stoneButton.alpha = 1.0
        self.paperLabel.alpha = 0.2
        self.scissorLabel.alpha = 0.2
        self.stoneLabel.alpha = 0.2
        self.resultView.isHidden = true
        self.resultLabel.isHidden = true
        self.startNewGameButton.isHidden = true
    }
    
    @IBAction func scissorPressed() {
        self.scissorButton.alpha = 1.0
        self.paperButton.alpha = 0.2
        self.stoneButton.alpha = 0.2
        self.player1.selectedItem = GameItem.Scissor
        self.player2.selectedItem = GameEngine.randomGameItem()
        self.update(label: self.player2.selectedItem!)
    }
    
    @IBAction func paperPressed() {
        self.scissorButton.alpha = 0.2
        self.paperButton.alpha = 1.0
        self.stoneButton.alpha = 0.2
        self.player1.selectedItem = GameItem.Paper
        self.player2.selectedItem = GameEngine.randomGameItem()
        self.update(label: self.player2.selectedItem!)
    }
    
    @IBAction func stonePressed() {
        self.scissorButton.alpha = 0.2
        self.paperButton.alpha = 0.2
        self.stoneButton.alpha = 1.0
        self.player1.selectedItem = GameItem.Stone
        self.player2.selectedItem = GameEngine.randomGameItem()
        self.update(label: self.player2.selectedItem!)
    }
    
    func update(label:GameItem)
    {
        self.scissorButton.isUserInteractionEnabled=false
        self.paperButton.isUserInteractionEnabled=false
        self.stoneButton.isUserInteractionEnabled=false
        switch label
        {
        case .Paper:
            self.paperLabel.alpha=1.0
            self.stoneLabel.alpha=0.2
            self.scissorLabel.alpha=0.2
        case .Scissor:
            self.paperLabel.alpha=0.2
            self.stoneLabel.alpha=0.2
            self.scissorLabel.alpha=1.0
        default:
            self.paperLabel.alpha=0.2
            self.stoneLabel.alpha=1.0
            self.scissorLabel.alpha=0.2
        }
        let result = GameEngine.evaluate(player1: self.player1, player2: self.player2)
        self.resultView.isHidden = false
        self.resultLabel.isHidden = false
        switch result
        {
        case GameResult.Player1Win:
            self.resultLabel.text = "Player 1 wins!"
        case GameResult.Player2Win:
            self.resultLabel.text = "Player 2 wins!"
        case GameResult.Draw:
            self.resultLabel.text = "Draw!"
        }
        self.startNewGameButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.restartButton()
    }
}
