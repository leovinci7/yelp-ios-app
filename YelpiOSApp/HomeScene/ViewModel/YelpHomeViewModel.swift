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
    let reviewCount: Int
    //let description: String?
    let location: String
   
}

class YelpHomeViewModel {
    private let apiClient: YelpAPIClientProtocol
    private(set) var businessFeed: [BusinessViewModel] = []
    
    var onUpdate: (() -> Void)?
    
    var numberOfRows: Int {
        return min(businessFeed.count, 10)
    }
    
    init(apiClient: YelpAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchBusinesses(term:String, location: String, categories: String, sortBy: String, limit: Int, completion: @escaping (Error?) -> Void) {
        
        apiClient.searchBusinesses(term: term, longitude: nil, latitude: nil, location: location, categories: categories, sortBy: sortBy, limit: limit) { [weak self] result in
            switch result {
            case .success(let businesses):
                self?.businessFeed = businesses.map { BusinessViewModel(name: $0.name,imageUrl: $0.imageUrl,rating: $0.rating, reviewCount: $0.reviewCount, location: $0.location.address1) }
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
            
        }
        onUpdate?()
    }
    
    func businessViewModel(at indexPath: IndexPath) -> BusinessViewModel {
        return businessFeed[indexPath.row]
    }
}

