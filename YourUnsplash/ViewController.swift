//
//  ViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

struct WebsiteDescription:Decodable {
    let name : String
    let description :String
    let courses: [Course]
}

struct Course:Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl:String?
    
    //    init(json:[String:Any]) {
    //        id = json["id"] as? Int ?? -1
    //        name = json["name"] as? String ?? ""
    //        link = json["link"] as? String ?? ""
    //        imageUrl = json["imageUrl"] as? String ?? ""
    //    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var showUIimage: UIImageView!
    
    var picArray = [UnsplashRoot]()
    
    var apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
    var apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        //              let jsonUrlString = apiRootUrl + apiAccessKey
        
        //         let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        //        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        let strUrl = "https://images.unsplash.com/photo-1521069611610-f684174f19e4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjIzMDY3fQ&s=3d5f24d9487ebb08023b1e6325be09af"
        
        let imgUrl = URL(string: strUrl)
        showUIimage.downloadedFrom(url: imgUrl!)
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        
        
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            //also perhaps check response status 200 ok
            //            print("do strff here")
            
            guard let data = data else {return}
            
            //            let dataAsString = String(data: data, encoding: .utf8)
            //            print(dataAsString)
            
            do {
                
                let course = try JSONDecoder().decode([Course].self, from: data)
                
                for i in course {
                    print(i)
                }
                
                //                // websiteDescription
                //
                //                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                //
                //                print(websiteDescription.name)
                
                //                // for course"s"
                //                let course = try JSONDecoder().decode([Course].self, from: data)
                //
                //                for i in course {
                //                    print(i)
                //                }
                
                //for swift 4 in course
                //                let course = try JSONDecoder().decode(Course.self, from: data)
                //                print(course.name)
                
                // in swift 2, 3 , object C
                //                guard let  json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                //
                //                let course = Course(json: json)
                //                print (course.name)
                //
                
            }catch let jsonErr{
                
                print("Error serializing json")
                print(jsonErr)
                
                
            }
            
            }.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

