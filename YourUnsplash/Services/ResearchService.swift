//
//  ResearchService.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-31.
//  Copyright © 2018 JenHao. All rights reserved.
//

import Foundation
public class ResearchService {
    func getSource(keyWordFromSerchView:String,completed: @escaping(_ result: [UnsplashRoot]) -> ()){
        
        let apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
        let apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
                let apiSearchKeyWord:String = "&query=" +  keyWordFromSerchView
        let apiCount:String = "&count=30"
        
        let jsonUrlString = apiRootUrl + apiAccessKey + apiSearchKeyWord + apiCount
//        let jsonUrlString = apiRootUrl + apiAccessKey + apiCount
        print("jsonUrlString: " + jsonUrlString)
        
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            guard let data = data else {return}
            
            do {
                let searchResultArray = try JSONDecoder().decode([UnsplashRoot].self, from: data)
                print("Got source successful")
                DispatchQueue.main.async {
                    completed(searchResultArray)
                }
            }catch let jsonErr{
                print("Error serializing json")
                print(jsonErr)
            }
            
            }.resume()
    }
}

