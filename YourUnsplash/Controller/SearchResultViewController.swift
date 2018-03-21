//
//  SearchResultViewController.swift
//  YourUnsplash
//
//  Created by JenHao on 2018-03-21.
//  Copyright © 2018 JenHao. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    
    var searchResultArray = [UnsplashRoot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get Json file from API
        
        getSource {
            self.resultTableView.reloadData()
        }
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray.count
    }
    
    // tableview cell data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! ResultCellTableViewCell
        let imageUrl = self.searchResultArray[indexPath.row].urls?.small
        cell.cellImage.downloadedFrom(url: imageUrl!)
        return cell
    }
    
    
    //identify the segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    // send data by segue to DetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.itemDetails = searchResultArray[(resultTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func getSource(completed: @escaping() -> ()){
        //        func getSource(){
        
        let apiRootUrl:String = "https://api.unsplash.com/photos/?client_id="
        let apiAccessKey:String = "f36a3f6ba90ed4c4d1872eb8fa50e7933ce1c6b287d44af7c0953c7780953e7c"
        
        let jsonUrlString = apiRootUrl + apiAccessKey
        
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
                    print(i)
                    print("")
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
    
}
