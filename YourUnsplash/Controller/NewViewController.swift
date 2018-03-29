//
//  NewViewController.swift
//  
//
//  Created by JenHao on 2018-03-28.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var info = [
  
    "陳偉殷","王建民","陳金鋒","林智勝"
    ]
    
    let fullScreenSize = UIScreen.main.bounds.size
    var newViewTableView: UITableView!
    let newRefreshControl = UIRefreshControl()
    
    var searchResultArray = [UnsplashRoot]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchResultArray = GetArray.getArrayfunc(keyword: "")
        print("self.searchResultArray=\(self.searchResultArray)")
        
        self.setUpTableView()
        self.view.addSubview(newViewTableView)
        
        self.newViewTableView.reloadData()
        self.newRefreshControl.addTarget(self, action: #selector(NewViewController.refreshList), for: .valueChanged)
    }
    
    @objc func refreshList(){
        print("refreshList")
    }
    

    
    
    func setUpTableView() {
        
        // set up newView Table view
        self.newViewTableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 64,
                width: self.fullScreenSize.width,
                height: self.fullScreenSize.height - 64) ,
            style: .grouped)
        
        // register cell
        newViewTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        newViewTableView.delegate = self
        newViewTableView.dataSource = self
        newViewTableView.separatorStyle = .none
        newViewTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        newViewTableView.allowsSelection = true
        newViewTableView.allowsMultipleSelection = false
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("searchResultArray.count=\(searchResultArray.count)")
//        return searchResultArray.count
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ResultCellTableViewCell
//        let imageUrl = self.searchResultArray[indexPath.row].urls?.small
//        cell.cellImage.downloadedFrom(url: imageUrl!)
//
//        cell.cellImage.layer.shadowOpacity = 0.5
//        cell.cellImage.clipsToBounds = true
//
//        return cell
        
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "Cell", for: indexPath) as
        UITableViewCell
        
        if let myLabel = cell.textLabel {
            myLabel.text =
            "\(info[indexPath.row])"
        }
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
