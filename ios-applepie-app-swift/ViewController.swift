//
//  ViewController.swift
//  ios-applepie-app-swift
//
//  Created by otavio brito on 10/11/2025.
//

import UIKit

var listOfWords = ["swift", "csharp", "java", "kotlin", "objectivec", "javascript", "reative"]

let incorrectMovesAllowed: Int = 7

var totalWins = 0
var totalLosses = 0


class ViewController: UIViewController {

    @IBOutlet weak var TreeImageView: UIImageView!
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var WordButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var activeGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        activeGame = Game(word: newWord, incorrectWord: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
        
    }
    
    func updateUI() {
        ScoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        TreeImageView.image = UIImage(named: "Tree \(activeGame.incorrectWord)")
    
    }

    @IBAction func WordButtonPress(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        activeGame.playerGuessed(letter: letter)
        updateUI()
    }
}

