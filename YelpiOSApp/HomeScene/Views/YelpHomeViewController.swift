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
    //var businessFeed = BusinessViewModel.prototypeFeed
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key)
    var viewModel:YelpHomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yelp"
        //let nib = UINib(nibName: "CustomHomeTableViewCell", bundle: nil)
        // tableView.register(nib, forCellReuseIdentifier: "CustomCellOne")
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = YelpHomeViewModel(apiClient: self.yelpAPIClient)
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.fetchBusinesses(term: "Italian", location: "Toronto", categories: "restaurants", sortBy: "best_match", limit: 10)
        { [weak self] error in
                    if let error = error {
                        print("Error fetching businesses: \(error.localizedDescription)")
                    } else {
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    }
                }
    }
}


extension YelpHomeViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
//        if(self.businessFeed.count < 10){
//            return businessFeed.count
//        }else{
//            return 10
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessViewCell") as! YelpHomeViewCustomCell
        //let model = self.businessFeed[indexPath.row]
        let model = viewModel.businessFeed[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension YelpHomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText != ""){
            
            viewModel.searchBusinesses(searchText: searchText)
        }
            
//            self.businessFeed = BusinessViewModel.prototypeFeed.filter({
//                $0.name.contains(searchText)
//            })
//            tableView.reloadData()
//
//        }else {
//            self.businessFeed = BusinessViewModel.prototypeFeed
//            tableView.reloadData()
//        }
    }
    
}
