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
    
    let quiz = [["Q1","False"],["Q2","True"],["Q3","False"]]
    var questionNumber = 0
    var timer:  Timer?
    
    var currentQuestion = updateUI
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      updateUI()
    
    }
    @objc func nextQuestion () {
        questionLabel.text = quiz[questionNumber][0]
    }
    @objc func retryAnswer () {
  questionLabel.text = quiz[questionNumber][0]
    }
    @IBAction func buttonsPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer { //Correct answer!!!
            questionLabel.text = "Your Right!!"
                
            
            //inner if-else
            if questionNumber < 2 { //Correct answer AND question is less than 3
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(nextQuestion), userInfo: nil, repeats: false)
                
                questionNumber = questionNumber + 1
                
            } else { //question number is 2 or more (end of the game)
                questionLabel.text = "Thanks for Playa hata!!"
                
                
                
                
            }
            
            
            
        } else { //WRONG ANSWER!!!
            questionLabel.text = "Please try again!"
            timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(retryAnswer), userInfo: nil, repeats: false)
        }
        
    }
    
func updateUI () {
    questionLabel.text = quiz[questionNumber][0]

}
}
//if questions.randomElement() && answerTrue {
//    questionLabel.text = quiz.randomElement()
//} else if answerFalse {
//    questionLabel.text = "Please Try again!"
//    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: false)
//
///
