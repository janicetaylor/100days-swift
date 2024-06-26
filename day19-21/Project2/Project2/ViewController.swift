//
//  ViewController.swift
//  Project2
//
//  Created by Janice on 1/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
       
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        var title: String
        
        let defaults = UserDefaults.standard
        var previousscore = defaults.integer(forKey: "score")

        if (sender as! UIButton).tag == correctAnswer {
            title = "Correct"
            score += 1

        } else {
            title = "Wrong"
            score -= 1
        }
        
        save(score: score)
        
        var message = "Your score is \(score)."
        var savedscore = defaults.integer(forKey: "score")
        
        if score > previousscore {
            message = "New high score! Your score is \(score)."
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)

    }
    
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func save(score:Int) {
        let defaults = UserDefaults.standard
        defaults.set(score, forKey: "score")
    }

}

