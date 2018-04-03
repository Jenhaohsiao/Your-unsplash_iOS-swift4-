//
//  KeyWordResultTableViewCell.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-04-03.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class KeyWordResultTableViewCell: UITableViewCell {

    let fullScreenSize = UIScreen.main.bounds.size
    //    var cellImage = UIImageView()
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var profile_name: UILabel!
    
    //     var profile_image: UIImageView!
    //     var profile_name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupElements()
    }
    
    
    fileprivate func setupElements() {
        // Initialization code
        self.profile_name.font = UIFont.systemFont(ofSize: 20.0)
        self.profile_name.alpha = 0.6
        self.profile_name.layer.cornerRadius = 5
        self.profile_name.layer.backgroundColor = UIColor.black.cgColor
        self.profile_name.textColor = UIColor.white
        
        
        self.profile_image.layer.cornerRadius = 10
        self.profile_image.layer.masksToBounds = true
    }
    
}
