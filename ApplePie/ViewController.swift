//
//  ViewController.swift
//  ApplePie
//
//  Created by Jahiz Ahmed on 3/2/24.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7;
    
    var totalWins = 00{
        didSet{
            newRound()
        }
    }
    
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    
    @IBOutlet var treeimage: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound();
        // Do any additional setsup after loading the view.
    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false;
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter:letter)
        updateGameState()
    }
    var currentGame:Game!
    func newRound ()
    {
        if (!listOfWords.isEmpty)
        {
            let newWord = listOfWords.removeFirst();
            currentGame = Game(words: newWord, incorrectMovesRemaining: incorrectMovesAllowed,
                               guessedLetters:[])
            enableLetterButtons()
            updateUI();
        }
    }
    
    func updateGameState()
    {
        if( currentGame.incorrectMovesRemaining == 0)
        {
            totalLosses += 1;
        }
        else if (currentGame.words == currentGame.formattedWord)
        {
            totalWins += 1 ;
        }
        else
        {
            updateUI()
        }
    }
    func enableLetterButtons()
    {
        for buttons in letterButtons
        {
            buttons.isEnabled = true;
        }
    }
    
    func updateUI()
    {
        print("updating UI")
        var letters:[String]=[]
        for eachLetter in currentGame.formattedWord
        {
            letters.append(String(eachLetter))
        }
        correctWordLabel.text = letters.joined(separator: " ");
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeimage.image = UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")
    }

}

