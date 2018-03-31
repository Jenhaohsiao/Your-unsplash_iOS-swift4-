//
//  SinglePhotoViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-31.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SinglePhotoViewController: UIViewController {
    
    @IBOutlet weak var singlePhotoImage: UIImageView!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var authorDetailButton: UIButton!
    
    var itemDetails: UnsplashRoot?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageUrl = itemDetails?.urls?.regular
        singlePhotoImage.downloadedFrom(url: imageUrl!)
        
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        goBack()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveImage(_ sender: Any) {
//
//        let imageData = UIImageJPEGRepresentation(showUIimage.image!, 1.0)
//        let compressdImage = UIImage(data:imageData!)
//        UIImageWriteToSavedPhotosAlbum(compressdImage!, nil, nil, nil)
//
//        let alert = UIAlertController(title: "Saved", message: "This image has been saved", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAction)
//        self.present(alert,animated: true,completion: nil)
    }
    
    // get data from API and put into struct
    
    
    
}
