//
//  ViewController.swift
//  NumberLock
//
//  Created by Kai on 2018/8/6.
//  Copyright © 2018年 Kai. All rights reserved.
//

import UIKit
import GameKit
class ViewController: UIViewController {
    // make a random answer
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxnumber = 100
    var minnumber =  1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func guessButton(_ sender: UIButton) {
        if isOver == false {
            // playing the game
            print(answer)
            let inputText = inputTextField.text!;
            //      clean input
            inputTextField.text=""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                messageLabel.text = "No input! Guess a number betweem \(minnumber) ~ \(maxnumber)"
            }else{
                if inputNumber! > 100{
                    messageLabel.text = "Too large! Guess a number betweem \(minnumber) ~ \(maxnumber)"
                    
                }else if inputNumber! < 1{
                    messageLabel.text = "Too small! Guess a number betweem \(minnumber) ~ \(maxnumber)"
                }else if inputNumber! == answer{
                    messageLabel.text = "You are right, Press [Guess] to play again"
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }
                else{
                    // wrong number s
                    if inputNumber! > answer{
                        maxnumber = inputNumber!
                    }else{
                        minnumber = inputNumber!
                    }
                    messageLabel.text = "Try again, Guess a number betweem \(minnumber) ~ \(maxnumber)"
                }
            }
        }else{
            // game is over
            minnumber = 1
            maxnumber = 100
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            messageLabel.text = "Guess a number betweem \(minnumber) ~ \(maxnumber)"
            isOver = false
            background.image = UIImage(named: "BG")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

