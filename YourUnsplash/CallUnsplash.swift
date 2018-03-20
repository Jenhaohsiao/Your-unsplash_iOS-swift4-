//
//  CallUnsplash.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import Foundation

struct CallUnsplash:Codable{
    
    var id:String
    var created_at:String
    var updated_at:String
    var width:Int
    var height: Int
    
    struct PictureUrls:Codable {
        var raw:URL
        var full:URL
        var regular:URL
        var small:URL
        var thumb:URL
    }
    
    var pictureUrls:[PictureUrls]
    
}
