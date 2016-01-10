//
//  ViewController.swift
//  navigation bar
//
//  Created by Taishi Kato on 2016/01/08.
//  Copyright © 2016年 Taishi Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func result() {
        print("1 second has passed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = NSTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

