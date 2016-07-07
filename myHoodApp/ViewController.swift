//
//  ViewController.swift
//  myHoodApp
//
//  Created by Pritinder Singh  on 6/29/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataServices.instance.loadPost()
        
      
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postLoaded", object: nil)
        
        tableView.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.loadedPost.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataServices.instance.loadedPost[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
        
            cell.configCell(post)
            return cell
        
        } else {
            
                let cell = PostCell()
                cell.configCell(post)
                return cell
            
            }
            
        
    }
    
    
    func onPostsLoaded(notif: AnyObject){
    
    
        tableView.reloadData()
    
    }
    


  

}

