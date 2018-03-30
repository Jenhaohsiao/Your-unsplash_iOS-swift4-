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
    
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var profile_name: UILabel!
    
    //     var profile_image: UIImageView!
//     var profile_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        self.cellImage =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height * 0.5))
//         self.contentView.addSubview(self.cellImage)
//        
//        self.profile_image = UIImageView.init(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
//        self.contentView.addSubview(self.profile_image)
//        
//        self.profile_name = UILabel(frame:CGRect.init(x: 50, y: 10, width:fullScreenSize.width - 80,height: 50))
//        self.profile_name.text = "test"
//        self.profile_name.font = UIFont.systemFont(ofSize: 15.0)
//        self.profile_name.textColor = UIColor.white
//        self.contentView.addSubview(self.profile_name)
//        print("cell init")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//    }
    
    
    
}
