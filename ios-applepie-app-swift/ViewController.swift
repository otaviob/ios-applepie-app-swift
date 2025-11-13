//
//  ViewController.swift
//  ios-applepie-app-swift
//
//  Created by otavio brito on 10/11/2025.
//

import UIKit

var listOfWords = ["swift", "csharp", "java", "kotlin", "objectivec", "javascript", "reative"]

let incorrectMovesAllowed: Int = 7


class ViewController: UIViewController {
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }

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
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            activeGame = Game(word: newWord, incorrectWord: incorrectMovesAllowed, guessedLetters: [])
            enableLtterButtons(true)
            updateUI()
        } else {
            enableLtterButtons(false)
        }
        
        
    }
    
    func enableLtterButtons(_ enabled: Bool) {
        for button in WordButton {
            button.isEnabled = enabled
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in activeGame.formatWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        WordLabel.text = wordWithSpacing
        
        
        
        ScoreLabel.text = "Wins: \(totalWins) - Losses: \(totalLosses)"
        TreeImageView.image = UIImage(named: "Tree \(activeGame.incorrectWord)")
    
    }

    @IBAction func WordButtonPress(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        activeGame.playerGuessed(letter: letter)
        
        /// update
        updateGameState()
    }
    
    func updateGameState() {
        if activeGame.incorrectWord == 0 {
            totalLosses += 1
        } else if activeGame.word == activeGame.formatWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

