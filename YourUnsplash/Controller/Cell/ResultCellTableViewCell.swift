//
//  ResultCellTableViewCell.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-21.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class ResultCellTableViewCell: UITableViewCell {
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    var cellImage: UIImageView!
    var profile_image: UIImageView!
    var profile_name: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
    }
    
    fileprivate func setupElements() {
        
        self.cellImage = UIImageView(frame: CGRect.init(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height * 0.5))
        
        self.contentView.addSubview(self.cellImage )

        self.profile_image = UIImageView(frame: CGRect.init(x: 15, y: 15, width: 50, height: 50))
        self.profile_image.layer.cornerRadius = 10
        self.profile_image.layer.masksToBounds = true
        self.contentView.addSubview(self.profile_image )
        
        self.profile_name = UILabel(frame: CGRect.init(x: 15, y: 45, width: fullScreenSize.width - 65, height:50))
        self.profile_name.font = UIFont.systemFont(ofSize: 20.0)
        self.profile_name.alpha = 0.6
        self.profile_name.layer.cornerRadius = 5
        self.profile_name.layer.backgroundColor = UIColor.black.cgColor
        self.profile_name.textColor = UIColor.white
        self.contentView.addSubview(self.profile_name )
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
