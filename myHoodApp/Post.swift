//
//  Post.swift
//  myHoodApp
//
//  Created by Pritinder Singh  on 6/30/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding   {


    private var _imagePath: String!
    private var _postTitle: String!
    private var _postDesc: String!
    
    
    var imagePath: String {
        return _imagePath
    }
    var postTitle : String {
        return _postTitle
    }
    var postDesc: String{
        return _postDesc
    }
    
    init(imagePath: String, postTitle: String, postDesc:String){
        
        self._imagePath = imagePath
        self._postTitle = postTitle
        self._postDesc = postDesc
    }
    
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._postDesc = aDecoder.decodeObjectForKey("postDesc") as? String
        self._postTitle = aDecoder.decodeObjectForKey("postTitle") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._postDesc, forKey: "postDesc")
        aCoder.encodeObject(self._postTitle, forKey: "postTitle")
    }
    
    

}