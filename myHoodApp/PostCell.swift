//
//  PostCell.swift
//  myHoodApp
//
//  Created by Pritinder Singh  on 6/30/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var postDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width/2
        postImg.clipsToBounds = true
    }
    
    
    func configCell(post: Post) {
    
        postLbl.text = post.postTitle
        postDesc.text = post.postDesc
        postImg.image = DataServices.instance.imageforPath(post.imagePath)
    }
    
    


}
