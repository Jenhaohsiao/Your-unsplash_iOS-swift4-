//
//  SearchViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-04-02.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var orientationSegmented: UISegmentedControl!
    
    
    @IBOutlet weak var SearchButtonText: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(SearchViewController.hideKeyboard(tapG:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    @IBAction func searchByKeyWordButton(_ sender: Any) {
//       performSegue(withIdentifier: "showSearchResult", sender: self)
    }
    
    
    // send data by segue to DetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SearchResultViewController {
            destination.searchKeyWord = searchTextField.text!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer){
        self.view.endEditing(true)
//        self.searchTextField.resignFirstResponder()
    }

   
}
