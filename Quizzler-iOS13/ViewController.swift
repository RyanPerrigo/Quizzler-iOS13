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
    
   
    let quiz = [
    Question(question: "Q1", answer: "True"),
    Question(question: "Q2", answer: "False"),
    Question(question: "Q3", answer: "True")
    ]
    
    
    
    var questionNumber = 0
    var timer:  Timer?
    
    var currentQuestion = updateUI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    
    }
    @objc func endOfGame () {
        questionNumber = 0
        updateUI()
        progressBar.progress = 0
    }
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
        
        if userAnswer == actualAnswer { //Correct answer!!!
            questionLabel.text = "Your Right!!"
            sender.backgroundColor = UIColor.green
                
                
            
            //inner if-else
            if questionNumber + 1 < quiz.count { //Correct answer AND question is less than 3
                questionNumber = questionNumber + 1
                progressBar.progress = Float(questionNumber) / Float(quiz.count)

                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                
                
                
            } else { //question number is 2 or more (end of the game)
                questionLabel.text = "Thanks For Playing!!"
                progressBar.progress = 1
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(endOfGame), userInfo: nil, repeats: false)
                
                
                
            }
            
            
            
        } else { //WRONG ANSWER!!!
            questionLabel.text = "Please try again!"
            sender.backgroundColor = UIColor.red
            timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
    }
    
@objc func updateUI () {
    questionLabel.text = quiz[questionNumber].question
    progressBar.progress = Float(questionNumber) / Float(quiz.count)
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
}
}
//if questions.randomElement() && answerTrue {
//    questionLabel.text = quiz.randomElement()
//} else if answerFalse {
//    questionLabel.text = "Please Try again!"
//    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: false)
//
///
