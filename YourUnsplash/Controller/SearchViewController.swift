//
//  SearchViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-21.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    

    var testStringFromSearch:String = "no key word"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        

    }
    
    // key word form icon button
   
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let SearchResult = segue.destination as? SearchResultViewController {
            SearchResult.keyWordFromSerchView = testStringFromSearch
        }
    }
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
