//
//  CameraCaption.swift
//  Project50
//
//  Created by Janice on 7/12/22.
//

import UIKit

class CameraCaption: NSObject, NSCoding {
    var caption: String
    var image: UIImage
    
    init(caption: String, image: UIImage) {
        self.caption = caption
        self.image = image
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(caption, forKey: "caption")
        coder.encode(image, forKey: "image")
    }
    
    required init?(coder: NSCoder) {
        caption = coder.decodeObject(forKey: "caption") as? String ?? ""
        image = (coder.decodeObject(forKey: "image") as? UIImage)!
    }

}
