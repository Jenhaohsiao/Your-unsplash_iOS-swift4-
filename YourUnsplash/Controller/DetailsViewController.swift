//
//  ViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var showUIimage: UIImageView!
    
    var picArray = [UnsplashRoot]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getSource()
        
        //Image form URL
        
        //        let strUrl = "https://images.unsplash.com/photo-1521069611610-f684174f19e4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjIzMDY3fQ&s=3d5f24d9487ebb08023b1e6325be09af"
        //        let imgUrl = URL(string: strUrl)
        //        showUIimage.downloadedFrom(url: imgUrl!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // get data from API and put into struct
    
    func getSource(){
        
        let apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
        let apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
        
        let jsonUrlString = apiRootUrl + apiAccessKey
        
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            guard let data = data else {return}
            
            do {
                let unsplashItem = try JSONDecoder().decode([UnsplashRoot].self, from: data)
                print(unsplashItem)
            }catch let jsonErr{
                print("Error serializing json")
                print(jsonErr)
            }
            
            }.resume()
    }
    
}

