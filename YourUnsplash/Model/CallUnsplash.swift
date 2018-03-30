//
//  CallUnsplash.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import Foundation

struct UnsplashRoot:Codable{
    
    let id:String?
    let created_at:String?
    let updated_at:String?
    let width:Int?
    let height: Int?
    let categories :Categories?
    let user:User?
    let urls:Urls?
    let links:Links?
    let liked_by_user:Bool?
    let sponsored:Bool?
    let likes:Int?
    let current_user_collections:Current_user_collections?
    
    
    struct Categories:Codable {
        
    }
    
    struct User:Codable {
        let id:String?
        let updated_at:String?
        let username:String?
        let name:String?
        let first_name:String?
        let last_name:String?
        let twitter_username:String?
        let portfolio_url:URL?
        let bio:String?
        let location:String?
//        let links:String?
        let profile_image:Profile_image?
        let total_collections:Int?
        let instagram_username:String?
        let total_likes:Int?
        let total_photos:Int?
        
        
        struct Profile_image:Codable {
            let small:URL?
            let medium:URL?
            let large:URL?
        }
        
        
    }
    
    struct Links:Codable {
        let self_:URL?
        let html:URL?
        let download:URL?
        let download_location:URL?
    }
    
    struct Urls:Codable {
        let raw:URL?
        let full:URL?
        let regular:URL?
        let small:URL?
        let thumb:URL?
    }
    
    struct Current_user_collections:Codable {
        
    }
    
    
  
    
    
    
    
    
}
