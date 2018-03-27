//
//  PostService.swift
//  CelebrityRecognition
//
//  Created by Shaurya Sinha on 27/03/18.
//  Copyright © 2018 CS490Team. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase.FIRDataSnapshot
import FirebaseAuth

struct PostService {
    let storage = Storage.storage(url: "gs://celebrity-recognition-701af.appspot.com/")
    
    static func create(for image: UIImage, name: String) {
        
        //let imageRef = StorageReference().child("test_image.jpg")
        
        let currTime = Date().timeIntervalSince1970
        let data = UIImageJPEGRepresentation(image, 0.1)
        let imageName = "\(currTime)Image.jpg"
        
        
        let imageRef =  StorageReference.newPostImageReference()
        
        let uploadTask = imageRef.putData(data!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else{
                print("Error uploading")
                return
            }
            let downloadUrl = metadata.downloadURL()?.absoluteString
            print("image url: \(String(describing: downloadUrl))")
            create(name: name, forURLString: downloadUrl!, aspectHeight: 700)
        }
    }
    
    private static func create(name: String, forURLString urlString: String, aspectHeight: CGFloat) {
        // create new post in database
        // 1
        let currentUser = Auth.auth().currentUser
        // 2
        let post = Post(name: name, imageURL: urlString, imageHeight: aspectHeight)
        // 3
        let dict = post.dictValue
        
        // 4
        let postRef = Database.database().reference().child("posts").child((currentUser?.uid)!).childByAutoId()
        //5
        postRef.updateChildValues(dict)
    }
    
    static func posts(for user: User, completion: @escaping ([Post]) -> Void) {
        let ref = Database.database().reference().child("posts").child(user.uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().flatMap(Post.init)
            completion(posts)
        })
    }
}
