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
    
    // A client class should never instantiate directly its dependencies. You should you property, method or constructor injection.
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key) // -> Bad practice
    // forcing unwrapping is a bad practice
    var viewModel:YelpHomeViewModel!
    let defaultSearchText = "Italian"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Yelp Home"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.text = defaultSearchText
        // A client class should never instantiate directly its dependencies. You should you property, method or constructor injection.
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
        // Forcing unwrapp is a code smell
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
        // I prefer to delegate the navigation target to another layer, like a composition root or a Coordinator
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
                print("Error fetching businesses: \(error.localizedDescription)") // print should not stay in production / release code
                // Why do you need to dispatch to main here ?
                DispatchQueue.main.async {
                    self?.showErrorAlert(message: error.localizedDescription)
                }
            } else {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    
    // Can this method be private ?
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



