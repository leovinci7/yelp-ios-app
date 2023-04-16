//
//  YelpHomeViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation
import UIKit

class YelpHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countryArray = Countries.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yelp"
        //let nib = UINib(nibName: "CustomHomeTableViewCell", bundle: nil)
        // tableView.register(nib, forCellReuseIdentifier: "CustomCellOne")
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension YelpHomeViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.countryArray.count < 10){
            return countryArray.count
        }else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellOne")
        cell?.textLabel?.text = self.countryArray[indexPath.row]
        
        return cell!
    }
}

extension YelpHomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText != ""){
            self.countryArray = Countries.all.filter({
                $0.contains(searchText)
            })
            tableView.reloadData()
            
        }else {
            self.countryArray = Countries.all
            tableView.reloadData()
        }
    }
    
}
