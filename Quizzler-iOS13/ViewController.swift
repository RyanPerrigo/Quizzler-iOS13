//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions: [String:Bool]  = [
        "Q1" : true,
        "Q2" : false,
        "Q3" : true
    ]
    let quiz = ["Q1","Q2","Q3"]
    let answerTrue = false
    let answerFalse = false
    var timer:  Timer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
       questionLabel.text = quiz.randomElement()
    
    }
    
    @objc func revertQuestion () {
        let newQuestion = quiz.randomElement()
        let currentQuestion = newQuestion.self
        questionLabel.text = currentQuestion
    }
    @IBAction func buttonsPressed(_ sender: UIButton) {
        
        
        if (answerTrue) {
            questionLabel.text = quiz.randomElement()
        } else if answerFalse {
            questionLabel.text = "Please Try again!"
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(revertQuestion), userInfo: nil, repeats: false)
        
        }
    }
    
}

