//
//  YelpHomeViewModel.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

struct BusinessViewModel {
    let name: String
    let imageUrl: String
    let rating: Double
    //let description: String?
    let location: String
   
}

class YelpHomeViewModel {
    private let apiClient: YelpAPIClientProtocol
    private(set) var businessFeed: [BusinessViewModel] = []
    
    var numberOfRows: Int {
        return min(businessFeed.count, 10)
    }
    
    init(apiClient: YelpAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchBusinesses(location: String, categories: String, sortBy: String, limit: Int, completion: @escaping (Error?) -> Void) {
        apiClient.searchBusinesses(location: location, categories: categories, sortBy: sortBy, limit: limit) { [weak self] result in
            switch result {
            case .success(let businesses):
               // self?.businessFeed = businesses.map { BusinessViewModel(from: $0) }
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func searchBusinesses(searchText: String) {
        if !searchText.isEmpty {
            businessFeed = businessFeed.filter { $0.name.contains(searchText) }
        } else {
            // Restore the original business feed, or call fetchBusinesses again
        }
    }
    
    func businessViewModel(at indexPath: IndexPath) -> BusinessViewModel {
        return businessFeed[indexPath.row]
    }
}

