//
//  ViewController.swift
//  bullseye
//
//  Created by admin on 7/5/18.
//  Copyright © 2018 Jasper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var score = 0
    var targetValue: Int=0
    var round = 1
    
    
    //you can use the above variables for anything throughout the whole script since it is under class but not under anything else
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        roundLabel.text = "1"
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startOver(){
        score = 0
        round = 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text =  String(score)
        roundLabel.text = String(round)
        
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        
        
        let difference: Int = abs(targetValue - currentValue)
        
        let feed: String
        
        let answ: String
        
        var points = 100 - difference
        
        if difference == 0 {
            feed = "Perfect!"
            answ = "Awesome!"
            points += 100
        }else if difference < 5{
            feed = "Pretty close!"
            answ = "Great!"
            points += 50
        }else if  difference < 10 {
            feed = "Not bad.."
            answ = "Okay!"
            points += 25
        }else {
            feed = "Not even close.."
            answ = "Next time I guess.."
        }
        
        score += points
        
        let message = "You scored \(points)"
        
        let alert = UIAlertController(title: feed , message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: answ , style: .default, handler: {
                action in
                    self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func popInfo() {
      
    }
}

