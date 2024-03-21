//
//  ViewController.swift
//  Hangman
//
//  Created by Janice on 2/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    let word = "RHYTHM"
    var usedLetters = ["R", "T"]
    var promptWord = ""
    var wrongAnswers = 0

    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var usedLettersLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guessLettersForWord()
        self.wordLabel.text = promptWord
        self.scoreLabel.text = String(wrongAnswers)
        updateUsedLetters()
    }
    
    @objc func updateUsedLetters() {
        let totalLetters = usedLetters.joined(separator: ", ")
        self.usedLettersLabel.text = totalLetters
    }

    @objc func guessLettersForWord() {
        self.promptWord = ""
        
        for letter in word {
            let strLetter = String(letter)

            if usedLetters.contains(strLetter) {
                promptWord += strLetter
            } else {
                promptWord += "?"
            }
        }

        self.wordLabel.text = promptWord
        self.scoreLabel.text = String(wrongAnswers)

        if(!self.promptWord.contains("?")) {
            self.infoLabel.text = "you won!"
        }
        
        self.scoreLabel.text = String(self.wrongAnswers)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let ac = UIAlertController(title: "Enter letter:", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    func submit(_ answer: String) {
        if(answer.count == 1) {
            let answer = answer.uppercased()
            usedLetters.append(answer)
            guessLettersForWord()
            updateUsedLetters()
        }
        else {
            self.infoLabel.text = "enter one letter only"
        }
       
    }
    
    
}

