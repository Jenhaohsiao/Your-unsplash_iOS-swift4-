//
//  SinglePhotoViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-31.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SinglePhotoViewController: UIViewController {
    
    
    @IBOutlet weak var authorButtonImage: UIButton!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var singlePhotoImage: UIImageView!
    @IBOutlet weak var goBackButton: UIButton!
    
    var itemDetails: UnsplashRoot?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhoto()
    }
    
    fileprivate func setupPhoto() {
        let imageUrl = itemDetails?.urls?.regular
        self.singlePhotoImage.downloadedFrom(url: imageUrl!)
        
        let authorImageUrl = itemDetails?.user?.profile_image?.medium
        let authorImage = UIImageView()
        authorImage.downloadedFrom(url: authorImageUrl!)
        
        self.authorButtonImage.setBackgroundImage(authorImage.image, for: .normal)
        
        let authorNameUrl = itemDetails?.user?.name
        self.authorNameLabel.text = authorNameUrl!
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
        let imageData = UIImageJPEGRepresentation(self.singlePhotoImage.image!, 1.0)
        let compressdImage = UIImage(data:imageData!)
        UIImageWriteToSavedPhotosAlbum(compressdImage!, nil, nil, nil)

        let alert = UIAlertController(title: "Saved", message: "This image has been saved", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    
    // get data from API and put into struct
    
    
    
}
