//
//  YelpHomeViewModel.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

// When you use the term ViewModel as a layer for MVVM, I suggest you not use for ViewData.
// I would rename it to BusinessViewData and save it in a separate file
struct BusinessViewModel {
    let id: String 
    let name: String
    let imageUrl: String
    let rating: Double
    let reviewCount: Int
    let location: String
   
}

class YelpHomeViewModel {
    private let apiClient: YelpAPIClientProtocol
    private(set) var businessFeed: [BusinessViewModel] = []
    private var currentWorkItem: DispatchWorkItem?
    
    var onUpdate: (() -> Void)?
    
    var numberOfRows: Int {
        return min(businessFeed.count, 10)
    }
    
    init(apiClient: YelpAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchBusinesses(term:String, location: String, categories: String, sortBy: SortBy, limit: Int, completion: @escaping (Error?) -> Void) {
        
        apiClient.searchBusinesses(term: term, longitude: nil, latitude: nil, location: location, categories: categories, sortBy: sortBy, limit: limit) { [weak self] result in
            switch result {
            case .success(let businesses):
                self?.businessFeed = businesses.map { BusinessViewModel(id: $0.id, name: $0.name,imageUrl: $0.imageUrl,rating: $0.rating, reviewCount: $0.reviewCount, location: $0.location.address1) }
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        
        }
        
    }
    
    
    func throttleFetchBusinesses(term: String, location: String, categories: String, sortBy: SortBy, limit: Int, completion: @escaping (Error?) -> Void) {
           currentWorkItem?.cancel()
            // Why did you decide to use DispatchWork here ?
           let workItem = DispatchWorkItem { [weak self] in
               self?.fetchBusinesses(term: term, location: location, categories: categories, sortBy: sortBy, limit: limit, completion: completion)
           }
           currentWorkItem = workItem
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: workItem)
       }

}

