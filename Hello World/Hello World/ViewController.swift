//
//  ViewController.swift
//  Hello World
//
//  Created by Taishi Kato on 2016/01/02.
//  Copyright © 2016年 Taishi Kato. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        print("Button Tapped!")
        
        label.text = textField.text
        let humanAge = label.text
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello Rob!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

