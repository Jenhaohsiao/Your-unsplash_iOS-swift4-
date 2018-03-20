//
//  ViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

struct Course {
    let id: Int
    let name: String
    let link: String
    let imageUrl:String
}

class ViewController: UIViewController {
    
    var apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
    var apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
              let jsonUrlString = apiRootUrl + apiAccessKey
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
                let  json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
            }catch let jsonErr{
                
                print("Error serializing json")
                
            }
            
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

