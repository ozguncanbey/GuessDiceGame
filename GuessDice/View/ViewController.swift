//
//  ViewController.swift
//  GuessDice
//
//  Created by Özgün Can Beydili on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    static var remainingPredict = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func slider(_ sender: Any) {
        sliderLabel.text = String(Int(sliderOutlet.value))
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        ViewController.remainingPredict = Int(sliderOutlet.value)
        
    }
}

