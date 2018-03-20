//
//  CallUnsplash.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import Foundation

struct UnsplashRoot:Codable{
    
    var id:String?
    var created_at:String?
    var updated_at:String?
    var width:Int?
    var height: Int?
    var categories :[Categories]?
    var urls:[Urls]?
    var links:[Links]?
    var liked_by_user:Bool?
    var sponsored:Bool?
    var likes:Int?
    var user:[User]?
    var current_user_collections:[Current_user_collections]?
    
    
    struct Categories:Codable {
        
    }
    
    struct Urls:Codable {
        var raw:URL?
        var full:URL?
        var regular:URL?
        var small:URL?
        var thumb:URL?
    }
    
  
    
    struct Links:Codable {
        var self_:URL?
        var html:URL?
        var download:URL?
        var download_location:URL?
    }
    
    struct User:Codable {
        var id:String?
        var updated_at:String?
        var username:String?
        var name:String?
        var first_name:String?
        var last_name:String?
        var twitter_username:String?
        var portfolio_url:URL?
        var bio:String?
        var location:String?
//        var links:String?
//        var profile_image:String?
        var total_collections:Int?
        var instagram_username:String?
        var total_likes:Int?
        var total_photos:Int?
        
    }
    
    struct Current_user_collections:Codable {
        
    }
    
    
    
    
    
}
