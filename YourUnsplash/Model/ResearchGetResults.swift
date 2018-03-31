//
//  ResearchGetResults.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-30.
//  Copyright © 2018 JenHao. All rights reserved.
//

import Foundation


struct ResearchGetResults{
    
    static let dispatchGroup = DispatchGroup()
    
    static var getArray = [UnsplashRoot]()
    static var searchResultArray = [UnsplashRoot]()
    
    static func getSource(){
        
        let apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
        let apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
        //        let apiSearchKeyWord:String = "&query=" +  keyWordFromSerchView
        let apiCount:String = "&count=10"
        
        //        let jsonUrlString = apiRootUrl + apiAccessKey + apiSearchKeyWord + apiCount
        let jsonUrlString = apiRootUrl + apiAccessKey + apiCount
        
        
        let url = URL(string: jsonUrlString)!
    
        print("url:\(url)")
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            guard let data = data else {return}
            
            do {
                self.getArray = try JSONDecoder().decode([UnsplashRoot].self, from: data)
                 print("check0")
        
            }catch let jsonErr{
                print("Error serializing json")
                print(jsonErr)
            }
            
            }.resume()
        print("check1")
    }
    
    static func getIntoArray(){
        self.searchResultArray = self.getArray
    }
    
    static func getArrayBack()->[UnsplashRoot]{
        getSource()
        
        
        dispatchGroup.enter()
        run(after: 2) {
             getIntoArray()
            self.dispatchGroup.leave()
            print("check2")
        }
        self.dispatchGroup.notify(queue: .main) {
           
            print("check3")
            
        }
        
        return self.searchResultArray
    }
    
    static func run(after seconds: Int, completion: @escaping () -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
        
    }
    
    static func testRetrun() ->String{
        return "This is testRetrun"
    }
}
