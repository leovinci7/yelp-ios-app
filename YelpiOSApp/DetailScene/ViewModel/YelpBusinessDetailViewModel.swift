//
//  YelpBusinessDetailViewModel.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 20/4/23.
//

import Foundation

struct BusinessDetailViewModel {
    public let id: String
    public let name: String
    public let imageUrl: String
    public let rating: Double
    public let reviewCount: Int
    public let price: String?
    public let phone: String
    public let location: String
    public let photos: [String]?
    public let isOpenNow: Bool
    
}

class YelpBusinessDetailViewModel {
    
    private let apiClient: YelpAPIClientProtocol
    private(set) var businessDetailFeed: BusinessDetailViewModel?
    
    var onUpdate: ((Error?) -> Void)?
    
    init(apiClient: YelpAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchBusinessDetailWithID(id businessId:String, completion: @escaping (Error?) -> Void){
        
        self.apiClient.getBusinessDetails(businessId: businessId){ [weak self] result in
            
            switch result{
            case let .success(businessDetail):
                self?.businessDetailFeed = BusinessDetailViewModel(id:businessDetail.id,
                                                             name: businessDetail.name,
                                                             imageUrl: businessDetail.imageUrl,
                                                             rating: businessDetail.rating,
                                                             reviewCount: businessDetail.reviewCount,
                                                             price: businessDetail.price,
                                                             phone: businessDetail.phone,
                                                             location: businessDetail.location.displayAddress.joined(separator: ","),
                                                                   photos: businessDetail.photos, isOpenNow: businessDetail.hours?[0].isOpenNow ?? false)
                completion(nil)
                
                
            case let .failure(error):
                completion(error)
            }
            
            
        }
        
        
    }
    
    
}
