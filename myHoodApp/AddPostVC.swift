//
//  AddPostVC.swift
//  myHoodApp
//
//  Created by Pritinder Singh  on 6/30/16.
//  Copyright © 2016 Pritinder Singh . All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var descLbl: UITextField!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
   
    @IBAction func cancelPostButtonTapped(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
      
    }
    @IBAction func addImageTapped(sender: AnyObject) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func makePostButtonTapped(sender: AnyObject) {
        
        if let title = titleLbl.text, let desc = descLbl.text, let img = imageView.image{
            
            let imgPath = DataServices.instance.saveImageAndImagePath(img)
            
            var post = Post(imagePath: imgPath , postTitle: title, postDesc: desc)
            DataServices.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)  
            
        
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = image
    }


}
