//
//  GameViewController.swift
//  GuessDice
//
//  Created by Özgün Can Beydili on 28.07.2023.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var predictLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var firstDiceImageView: UIImageView!
    @IBOutlet weak var secondDiceImageView: UIImageView!
    @IBOutlet weak var predictTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    
    var remainingPredict = ViewController.remainingPredict
    var predict = 0
    var result = 0
    var firstRandom = 0
    var secondRandom = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        restart()
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func rollButtonTapped(_ sender: Any) {
        rollButton.isEnabled = false
        firstRandom = Int.random(in: 1...6)
        secondRandom = Int.random(in: 1...6)
        result = firstRandom + secondRandom
        print(firstRandom, secondRandom)
    }
    
    @IBAction func guessButtonTapped(_ sender: Any) {
        if rollButton.isEnabled == true {
            let alert = UIAlertController(title: "!!!", message: "You must ROLL first!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            present(alert, animated: true)
        } else {
            if let predict = Int(predictTextField.text!) {
                remainingPredict -= 1
                if predict == result {
                    againButton.isHidden = false
                    guessButton.isEnabled = false
                    resultLabel.text = "Correct!"
                    againButton.titleLabel?.text = "Play Again"
                    predictLabel.text = "Remaining Predictions: \(remainingPredict + 1)"
                    firstDiceImageView.image = showDice(firstRandom)
                    secondDiceImageView.image = showDice(secondRandom)
                } else {
                    if remainingPredict > 0 {
                        predictLabel.text = "Remaining Predictions: \(remainingPredict)"
                        predictTextField.text = ""
                    } else {
                        againButton.isHidden = false
                        predictLabel.text = "Remaining Predictions: \(remainingPredict)"
                        resultLabel.text = "Wrong!"
                        againButton.titleLabel?.text = "Try Again"
                        firstDiceImageView.image = showDice(firstRandom)
                        secondDiceImageView.image = showDice(secondRandom)
                        guessButton.isEnabled = false
                    }
                }
            }
        }
    }
    
    @IBAction func againButtonTapped(_ sender: Any) {
        restart()
    }
    
    func restart() {
        rollButton.isEnabled = true
        againButton.isHidden = true
        guessButton.isEnabled = true
        resultLabel.text = ""
        remainingPredict = ViewController.remainingPredict
        predict = 0
        result = 0
        predictTextField.text = ""
        predictLabel.text = "Remaining Predictions: \(remainingPredict)"
        firstDiceImageView.image = UIImage(named: "undefineddice")
        secondDiceImageView.image = UIImage(named: "undefineddice")
    }
    
    func showDice(_ dice: Int) -> UIImage {
        switch dice {
        case 1:
            return UIImage(named: "dice1")!
        case 2:
            return UIImage(named: "dice2")!
        case 3:
            return UIImage(named: "dice3")!
        case 4:
            return UIImage(named: "dice4")!
        case 5:
            return UIImage(named: "dice5")!
        case 6:
            return UIImage(named: "dice6")!
        default:
            return UIImage(named: "dice")!
        }
    }
}
