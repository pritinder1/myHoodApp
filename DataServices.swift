//
//  DataServices.swift
//  myHoodApp
//
//  Created by Pritinder Singh  on 6/30/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import Foundation
import UIKit


class DataServices {
    
    let POST_KEYS = "posts"

    static let instance = DataServices()
    
    private var _loadedPost = [Post]()
    
    var loadedPost: [Post]{
    
        return _loadedPost
    }
    
    func savePost() {
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPost)
            
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: POST_KEYS)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    
    }
    
    
    func loadPost() {
        
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(POST_KEYS) as? NSData {
        
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                    _loadedPost = postsArray
            
            }
        
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
        
    }
    
    func saveImageAndImagePath(image: UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageforPath(path: String) -> UIImage? {
    
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    func addPost(post: Post){
    
            _loadedPost.append(post)
            savePost()
            loadPost()
    
    }
    
    
    func documentsPathForFileName(name: String) -> String {
    
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    
    }
    
    
}
