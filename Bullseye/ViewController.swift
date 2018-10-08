//
//  ViewController.swift
//  Bullseye
//
//  Created by Tetiana Marych on 10/3/18.
//  Copyright © 2018 Tetiana Marych. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var randomNumber = 0

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactMode: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewRandomNumber()
    }

    @IBAction func playAgain(_ sender: Any) {
        setNewRandomNumber()
        resetState()
    }
    
    @IBAction func check(_ sender: Any) {
        if exactMode.isOn == false {
            if Int(slider.value) <= randomNumber + 3 &&
                Int(slider.value) >= randomNumber - 3 {
                dispayResultMessage(isWinner: true)
            } else {
                dispayResultMessage(isWinner: false)
            }
        } else {
            if Int(slider.value) == randomNumber {
                dispayResultMessage(isWinner: true)
            } else {
                dispayResultMessage(isWinner: false)
            }
        }
        
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    func resetState() {
        playAgainButton.isHidden = true
        resultLabel.isHidden = true
        slider.setValue(50.0, animated: false)
    }
    
    func setNewRandomNumber() {
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNumber)"
    }
    
    func dispayResultMessage(isWinner: Bool ) {
        if isWinner {
            resultLabel.text = "You were right on point! Bullseye!"
            resultLabel.backgroundColor = UIColor.green
        } else {
            resultLabel.text = "Whoops! You missed! Try again later"
            resultLabel.backgroundColor = UIColor.red
        }
    }
}

