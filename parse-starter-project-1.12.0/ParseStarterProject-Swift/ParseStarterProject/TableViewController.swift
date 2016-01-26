//
//  TableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by 加藤　大志 on 2016/01/25.
//  Copyright © 2016年 Parse. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {
    
    var username = [""]
    var userids  = [""]
    var isFollowing = [false]

    override func viewDidLoad() {
        super.viewDidLoad()

        var query = PFUser.query()
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if let users = objects {
                
                self.username.removeAll(keepCapacity: true)
                self.userids.removeAll(keepCapacity: true)
                self.isFollowing.removeAll(keepCapacity: true)
                
                for object in users {
                    
                    if let user = object as? PFUser {
                        
                        if user.objectId != PFUser.currentUser()?.objectId {
                            self.username.append(user.username!)
                            self.username = self.username.sort {$0 < $1}
                            self.userids.append(user.objectId!)
                            self.userids = self.userids.sort {$0 < $1}
                            
                            var query = PFQuery(className: "followers")
                            query.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
                            query.whereKey("following", equalTo: user.objectId!)
                            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                                if let objects = objects {
                                    if objects.count > 0 {
                                        self.isFollowing.append(true)
                                    } else {
                                        self.isFollowing.append(false)
                                    }
                                }
                                
                                if self.isFollowing.count == self.username.count {
                                    self.tableView.reloadData()
                                }
                            })
                        }
                    }
                }
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return username.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = username[indexPath.row]
        
        if isFollowing[indexPath.row] == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if isFollowing[indexPath.row] == false {
        
            isFollowing[indexPath.row] = true
            
            let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
            let following = PFObject(className: "followers")
            following["following"] = userids[indexPath.row]
            following["follower"]  = PFUser.currentUser()?.objectId
        
            following.saveInBackground()
        }
    }
 }
