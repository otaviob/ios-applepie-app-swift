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
    
    var ActiveGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            ActiveGame = Game(word: newWord, incorrectWord: incorrectMovesAllowed, guessedLetters: [])
            
            /// update
            updateUI()
        }
        
        
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in ActiveGame.formatWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        WordLabel.text = wordWithSpacing
        
        
        
        ScoreLabel.text = "Wins: \(totalWins) - Losses: \(totalLosses)"
        TreeImageView.image = UIImage(named: "Tree \(ActiveGame.incorrectWord)")
    
    }

    @IBAction func WordButtonPress(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        ActiveGame.playerGuessed(letter: letter)
        
        /// update
        updateUI()
    }
    
    func updateGameState() {
        if ActiveGame.incorrectWord == 0 {
            totalLosses += 1
        } else if ActiveGame.word == ActiveGame.formatWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

