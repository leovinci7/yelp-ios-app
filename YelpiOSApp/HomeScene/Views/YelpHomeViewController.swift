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
    @IBOutlet weak var sortControlView: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //var businessFeed = BusinessViewModel.prototypeFeed
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key)
    var viewModel:YelpHomeViewModel!
    let defaultSearchText = "Italian"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yelp"
        //let nib = UINib(nibName: "CustomHomeTableViewCell", bundle: nil)
        // tableView.register(nib, forCellReuseIdentifier: "CustomCellOne")
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.text = defaultSearchText
        
        viewModel = YelpHomeViewModel(apiClient: self.yelpAPIClient)
        
        
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
       
        let sortValue = getSortByValue(for: sortControlView.selectedSegmentIndex)
        reloadDataWith(term: defaultSearchText, sort: sortValue)
       
    }
    
    @IBAction func sortControlValueChanged(_ sender: UISegmentedControl) {
        
        let sortValue = getSortByValue(for: sender.selectedSegmentIndex)
        let searchText = searchBar.text ?? ""
        reloadDataWith(term: searchText, sort: sortValue)
        
        let selectedIndex = sender.selectedSegmentIndex
        print("Selected segment index: \(selectedIndex)")
        
        // You can also get the title of the selected segment like this:
        let selectedTitle = sender.titleForSegment(at: selectedIndex)
        print("Selected segment title: \(selectedTitle ?? "None")")
        
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
            
            // viewModel.searchBusinesses(searchText: searchText)
            let sortValue = getSortByValue(for: sortControlView.selectedSegmentIndex)
            
            reloadDataWith(term: searchText, sort: sortValue)
            
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
}


extension YelpHomeViewController {
    
    func reloadDataWith(term searchText : String, sort sortValue: SortBy){
        
        viewModel.fetchBusinesses(term: searchText, location: "Toronto", categories: "restaurants", sortBy: sortValue, limit: 10)
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
    
    
    
    func getSortByValue(for selectedIndex: Int) -> SortBy {
        switch selectedIndex {
        case 0:
            return .bestMatch
        case 1:
            return .rating
        case 2:
            return .reviewCount
        default:
            return .bestMatch
        }
    }
    
}



