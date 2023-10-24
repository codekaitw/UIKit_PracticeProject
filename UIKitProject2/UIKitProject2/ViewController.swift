//
//  ViewController.swift
//  UIKitProject2
//
//  Created by AndrewLuo on 2023-10-23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var buttons: [UIButton] = []
    var askedQuestionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "ploand", "russia", "spain", "uk", "us"]
        
        buttons += [button1, button2, button3]
        for button in buttons {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.3, blue: 0.8, alpha: 0.5).cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " score: \(score)"
        
        askedQuestionCount += 1
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's flag of \(countries[sender.tag])"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        if askedQuestionCount >= 9 {
            ac.message = "Your final score is \(score)"
            score = 0
            askedQuestionCount = 0
        }
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
}

