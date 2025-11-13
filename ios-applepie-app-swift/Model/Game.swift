//
//  Game.swift
//  ios-applepie-app-swift
//
//  Created by otavio brito on 12/11/2025.
//

import Foundation

struct Game {
    var word: String
    var incorrectWord: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectWord -= 1
        }
        
    }
    
    var formatWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
