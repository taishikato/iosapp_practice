/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Image Selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        importedImage.image = image
    }
    
    @IBOutlet var importedImage: UIImageView!
    
    @IBAction func importImage(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        /*
        let products = PFObject(className: "Products")
        
        products["name"] = "Ice Cream"
        products["description"] = "Fucking Cold"
        products["price"] = 6.99
        
        products.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                print("Object saved with ID \(products.objectId)")
            } else {
                print("failed")
                print(error)
            }
        }

        
        let query = PFQuery(className: "Products")
        
        query.getObjectInBackgroundWithId("dFWG0OAviP") { (object: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let product = object {
                //let desc = object!.objectForKey("description")
                
                product["description"] = "Igyaaa!"
                
                product["price"] = 5.99
                
                product.saveInBackground()
                
            }
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
