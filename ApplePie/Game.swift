//
//  Game.swift
//  ApplePie
//
//  Created by Jahiz Ahmed on 3/3/24.
//

import Foundation
struct Game
{
    var words:String
    var incorrectMovesRemaining:Int
    var guessedLetters:[Character]
    
    mutating func playerGuessed (letter:Character)
    {
        guessedLetters.append(letter)
        
        if (!words.contains(letter))
        {
            incorrectMovesRemaining -= 1;
        }
    }
    
    var formattedWord:String{
        var guessedWord = ""
        for letter in words
        {
            if guessedLetters.contains(letter)
            {
                guessedWord+="\(letter)"
            }
            else
            {
                guessedWord+="_"
            }
        }
        return guessedWord
    }
}
