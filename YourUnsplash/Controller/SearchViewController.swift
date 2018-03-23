//
//  SearchViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-21.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    

    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var fashionButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var petButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var technologyButton: UIButton!
    @IBOutlet weak var urbanButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var yourWordButton: UIButton!
    

    var testStringFromSearch:String = "no key word"
    
    @IBOutlet weak var keyWordTextFieid: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
   setUpButtons()
        

    }
    
    // key word form icon button
    @IBAction func keyWordFromIcon(_ sender: Any) {
        
        let mynumber:Int = (sender as AnyObject).tag
        print("mynumber=")
        print(mynumber)
        
        switch mynumber{
        case 1:
            testStringFromSearch = "car"
        case 2:
            testStringFromSearch = "design"
        case 3:
            testStringFromSearch = "fashion"
        case 4:
            testStringFromSearch = "food"
        case 5:
            testStringFromSearch = "love"
        case 6:
            testStringFromSearch = "nature"
        case 7:
            testStringFromSearch = "pet"
        case 8:
            testStringFromSearch = "sports"
        case 9:
            testStringFromSearch = "technology"
        case 10:
            testStringFromSearch = "urban"
        case 11:
            testStringFromSearch = ""
        case 12:
            testStringFromSearch = "travel"
        default:
            testStringFromSearch = ""
        }
        
        performSegue(withIdentifier: "keyWordSegue", sender: self)
    }
    
    
   
    
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
    

    func setUpButtons(){
        
        self.carButton.layer.masksToBounds = true
        self.carButton.layer.cornerRadius = 10
        self.carButton.layer.shadowOpacity = 0.5
        
        self.designButton.layer.masksToBounds = true
        self.designButton.layer.cornerRadius = 10
        self.designButton.layer.shadowOpacity = 0.5
        
        self.fashionButton.layer.masksToBounds = true
        self.fashionButton.layer.cornerRadius = 10
        self.fashionButton.layer.shadowOpacity = 0.5
        
        self.foodButton.layer.masksToBounds = true
        self.foodButton.layer.cornerRadius = 10
        self.foodButton.layer.shadowOpacity = 0.5
        
        self.loveButton.layer.masksToBounds = true
        self.loveButton.layer.cornerRadius = 10
        self.loveButton.layer.shadowOpacity = 0.5
        
        self.natureButton.layer.masksToBounds = true
        self.natureButton.layer.cornerRadius = 10
        self.natureButton.layer.shadowOpacity = 0.5
        
        self.petButton.layer.masksToBounds = true
        self.petButton.layer.cornerRadius = 10
        self.petButton.layer.shadowOpacity = 0.5
        
        self.sportsButton.layer.masksToBounds = true
        self.sportsButton.layer.cornerRadius = 10
        self.sportsButton.layer.shadowOpacity = 0.5
        
        self.technologyButton.layer.masksToBounds = true
        self.technologyButton.layer.cornerRadius = 10
        self.technologyButton.layer.shadowOpacity = 0.5
        
        self.urbanButton.layer.masksToBounds = true
        self.urbanButton.layer.cornerRadius = 10
        self.urbanButton.layer.shadowOpacity = 0.5
        
        self.randomButton.layer.masksToBounds = true
        self.randomButton.layer.cornerRadius = 10
        self.randomButton.layer.shadowOpacity = 0.5
        
        self.yourWordButton.layer.masksToBounds = true
        self.yourWordButton.layer.cornerRadius = 10
        self.yourWordButton.layer.shadowOpacity = 0.5
    }

}
