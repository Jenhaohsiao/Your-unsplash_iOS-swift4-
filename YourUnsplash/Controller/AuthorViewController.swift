//
//  AuthorViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-04-02.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {
    

    
    @IBOutlet weak var authourImage: UIImageView!
    
    @IBOutlet weak var authourNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toPreviousView(_ sender: Any) {
        goBack()
    }
    
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
