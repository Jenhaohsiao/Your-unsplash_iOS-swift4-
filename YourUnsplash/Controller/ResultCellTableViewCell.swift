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
    var cellImage = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.cellImage.frame = CGRect(x: 0 , y: 0  , width: fullScreenSize.width, height: fullScreenSize.height * 0.3)
        
        contentMode = .scaleToFill
        
        contentView.addSubview(self.cellImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

 
}
