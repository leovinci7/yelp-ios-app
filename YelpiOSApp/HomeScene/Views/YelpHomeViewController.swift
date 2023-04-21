//
//  YelpHomeViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation
import UIKit

class YelpHomeViewController: BaseViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortControlView: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //var businessFeed = BusinessViewModel.prototypeFeed
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key)
    var viewModel:YelpHomeViewModel!
    let defaultSearchText = "Italian"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Yelp Home"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.text = defaultSearchText
        
        viewModel = YelpHomeViewModel(apiClient: self.yelpAPIClient)
        let sortValue = getSortValue(for: sortControlView.selectedSegmentIndex)
        reloadDataWith(term: defaultSearchText, sort: sortValue)
        
    }
    
    @IBAction func sortControlValueChanged(_ sender: UISegmentedControl) {
        let sortValue = getSortValue(for: sender.selectedSegmentIndex)
        let searchText = searchBar.text ?? ""
        reloadDataWith(term: searchText, sort: sortValue)
    }
}


extension YelpHomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessViewCell") as! YelpHomeViewCustomCell
        let model = viewModel.businessFeed[indexPath.row]
        cell.configure(with: model)
        cell.fadeIn()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = viewModel.businessFeed[indexPath.row].id
        
        let detailViewController = UIStoryboard(name: "BusinessDetail", bundle: nil).instantiateViewController(withIdentifier: "YelpBusinessDetailView") as! YelpBusinessDetailViewController
        
        detailViewController.selectedItem = selectedItem
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}

extension YelpHomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText != ""){
            let sortValue = getSortValue(for: sortControlView.selectedSegmentIndex)
            
            reloadDataWith(term: searchText, sort: sortValue)
            
        }
    }
}


extension YelpHomeViewController {
    
    func reloadDataWith(term searchText : String, sort sortValue: SortBy){
        
        activityIndicator.startAnimating()
        viewModel.throttleFetchBusinesses(term: searchText, location: "Toronto", categories: "restaurants", sortBy: sortValue, limit: 10)
        { [weak self] error in
            if let error = error {
                print("Error fetching businesses: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    
    
    func getSortValue(for selectedIndex: Int) -> SortBy {
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



