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
//    var cellImage = UIImageView()
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.cellImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        self.cellImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        self.cellImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.cellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
//        self.addSubview(self.cellImage)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    
}
