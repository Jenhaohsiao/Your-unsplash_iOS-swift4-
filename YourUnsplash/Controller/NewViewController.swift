//  NewViewController.swift
//  Created by JenHao on 2018-03-28.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fullScreenSize = UIScreen.main.bounds.size
    var searchResultArray = [UnsplashRoot]()
    @IBOutlet weak var newViewTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newViewTableView.delegate = self
        self.newViewTableView.dataSource = self
        self.newViewTableView.separatorStyle = .none
        self.newViewTableView.reloadData()
        
        updataeUI()
        
    }
    
    fileprivate func updataeUI() {
        ResearchSearvice().getSource(keyWordFromSerchView: "") { (result) in
            self.searchResultArray = result
            self.newViewTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // load more data when the view reach the bottom
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastElement = searchResultArray.count - 1
        if indexPath.row == lastElement {
            if searchResultArray.count != 0 {
                print("need more data")
            }
            
        }
    }
    
    //identify the segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSinglePhoto", sender: self)
        
    }
    
    // send data by segue to DetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SinglePhotoViewController {
            destination.itemDetails = searchResultArray[(newViewTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray.count
    }
    
    
    //Setup the cell content
    func configure(cell:ResultCellTableViewCell, forItemAt indexPath: IndexPath) {
        //set up the image
        let imageUrl = self.searchResultArray[indexPath.row].urls?.regular
        cell.cellImage.downloadedFrom(url: imageUrl!)
        
        //set up the author image
        let profileImageUrl = self.searchResultArray[indexPath.row].user?.profile_image?.medium
        cell.profile_image.downloadedFrom(url: (profileImageUrl)!)
        
        //Set up the author name Lable
        let profileNameString = self.searchResultArray[indexPath.row].user?.name
        cell.profile_name.text = "  \(profileNameString!)  "
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "customCell"
        
        guard let cell = self.newViewTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ResultCellTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    
    
    // Setup the height For Row, by image size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHight = (Float(self.searchResultArray[indexPath.row].height!) * 0.1)
        if rowHight < 300 {
            rowHight = 300
        }
        return CGFloat(rowHight)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
