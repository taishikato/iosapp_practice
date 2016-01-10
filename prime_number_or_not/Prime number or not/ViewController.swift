//
//  ViewController.swift
//  Prime number or not
//
//  Created by Taishi Kato on 2016/01/06.
//  Copyright © 2016年 Taishi Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet var answerTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    @IBAction func answerButton(sender: AnyObject) {
        
        let userAnswer = answerTextField!.text
        
        let result = isPrimeNumber(Int(userAnswer!)!)
        
        if result == true {
            
            resultLabel.text = "Prime!"
            
        } else {
            
            resultLabel.text = "Not prime"
            
        }
        
    }
    
    // prime number or not?
    func isPrimeNumber(num: Int) -> Bool {
        if num < 2 {
            return false
        } else if num == 2 {
            return true
        }
        
        if num % 2 == 0 {
            return false
        }
        
        for var i = 3; i * i <= num; i += 2 {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}

