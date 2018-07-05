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
    
    var targetValue: Int=0
    
    //you can use the above variables for anything throughout the whole script since it is under class but not under anything else
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        currentValue = lroundf(slider.value)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        
        currentValue = lroundf(slider.value)
        
        targetValue = 1 + Int(arc4random_uniform(100))
    }
    
    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)	
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

