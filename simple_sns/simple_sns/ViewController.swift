//
//  ViewController.swift
//  simple_sns
//
//  Created by Taishi Kato on 2016/02/07.
//  Copyright © 2016年 Taishi Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func showActivityView(sender: UIBarButtonItem) {
        
        let controller = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

