//
//  ViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-19.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit
import Photos

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var showUIimage: UIImageView!
    
    @IBOutlet weak var showIDLabel: UILabel!
    
    var itemDetails: UnsplashRoot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showIDLabel.text = itemDetails?.id
        
        //Image form URL
        
        //        let strUrl = "https://images.unsplash.com/photo-1521069611610-f684174f19e4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjIzMDY3fQ&s=3d5f24d9487ebb08023b1e6325be09af"
        let imageUrl = itemDetails?.urls?.regular
        showUIimage.downloadedFrom(url: imageUrl!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveImage(_ sender: Any) {
        
        let imageData = UIImageJPEGRepresentation(showUIimage.image!, 1.0)
        let compressdImage = UIImage(data:imageData!)
        UIImageWriteToSavedPhotosAlbum(compressdImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "This image has been saved", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    
    // get data from API and put into struct
    
   
    
}

