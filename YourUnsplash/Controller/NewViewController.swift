//
//  NewViewController.swift
//  
//
//  Created by JenHao on 2018-03-28.
//

import UIKit


class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fullScreenSize = UIScreen.main.bounds.size
//    var newViewTableView: UITableView!
    
    var searchResultArray = [UnsplashRoot]()
    
    @IBOutlet weak var newViewTableView: UITableView!
    
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setUpTableView()
//        self.view.addSubview(newViewTableView)
        
        self.newViewTableView.delegate = self
        self.newViewTableView.dataSource = self
        self.newViewTableView.separatorStyle = .none
        
        self.newViewTableView.reloadData()
        
        getSource {
            self.newViewTableView.reloadData()
        }
        self.newViewTableView.estimatedRowHeight = 200
        self.newViewTableView.rowHeight = UITableViewAutomaticDimension

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
        self.newViewTableView.estimatedRowHeight = 200
        self.newViewTableView.rowHeight = UITableViewAutomaticDimension

    }
    
    func setUpTableView() {
        
        // set up newView Table view
        self.newViewTableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.fullScreenSize.width,
                height: self.fullScreenSize.height) ,
            style: .grouped)
        
        
        
        // register cell
//        self.newViewTableView.register(ResultCellTableViewCell.self, forCellReuseIdentifier: "customCell")
        
//        self.newViewTableView.delegate = self
//        self.newViewTableView.dataSource = self
//        self.newViewTableView.separatorStyle = .none
//        self.newViewTableView.contentMode = .scaleToFill
//        self.newViewTableView.semanticContentAttribute = .unspecified
//        //        self.newViewTableView.separatorInset = UIEdgeInsetsMake(1, 1, 1, 1)
//        self.newViewTableView.allowsSelection = true
//        self.newViewTableView.allowsMultipleSelection = false
        
    }
    
    
    func getSource(completed: @escaping() -> ()){
        //        func getSource(){
        
        let apiRootUrl:String = "https://api.unsplash.com/photos/random/?client_id="
        let apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
//        let apiSearchKeyWord:String = "&query=" +  keyWordFromSerchView
        let apiCount:String = "&count=30"
        
//        let jsonUrlString = apiRootUrl + apiAccessKey + apiSearchKeyWord + apiCount
        let jsonUrlString = apiRootUrl + apiAccessKey + apiCount
        print("jsonUrlString: " + jsonUrlString)
        
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            guard let data = data else {return}
            
            do {
                self.searchResultArray = try JSONDecoder().decode([UnsplashRoot].self, from: data)
                print("Got source successful")
                
                //Check if the result is nil or not
                guard self.searchResultArray.count != 0 else{
                    print("We can't get any data from Unsplash")
                    return
                }
                
                for i in self.searchResultArray{
                    //                    print(i)
                    //                    print("")
                }
                
                
                DispatchQueue.main.async{
                    completed()
                }
                
            }catch let jsonErr{
                print("Error serializing json")
                print(jsonErr)
            }
            
            }.resume()
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("searchResultArray.count=\(searchResultArray.count)")
        return searchResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "customCell"
        
        let cell = self.newViewTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ResultCellTableViewCell
        
//        let imageUrl = self.searchResultArray[indexPath.row].urls?.small
        let imageUrl = self.searchResultArray[indexPath.row].urls?.regular
        cell.cellImage.downloadedFrom(url: imageUrl!)

        return cell
        
    
    }
    
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
    
  
    
//    func setUpTableView() {
//
//        // set up newView Table view
//        self.newViewTableView = UITableView(
//            frame: CGRect(
//                x: 0,
//                y: 0,
//                width: self.fullScreenSize.width,
//                height: self.fullScreenSize.height) ,
//            style: .grouped)
//
//
//
//        // register cell
//        self.newViewTableView.register(ResultCellTableViewCell.self, forCellReuseIdentifier: "customCell")
//
//        self.newViewTableView.delegate = self
//        self.newViewTableView.dataSource = self
//        self.newViewTableView.separatorStyle = .none
//        self.newViewTableView.contentMode = .scaleToFill
//        self.newViewTableView.semanticContentAttribute = .unspecified
////        self.newViewTableView.separatorInset = UIEdgeInsetsMake(1, 1, 1, 1)
//        self.newViewTableView.allowsSelection = true
//        self.newViewTableView.allowsMultipleSelection = false
//
//    }
//

    
}
