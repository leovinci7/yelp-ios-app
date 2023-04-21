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
    public let categories: String
    public let todayOperatingHour: String
    
}

class YelpBusinessDetailViewModel {
    
    private let apiClient: YelpAPIClientProtocol
    private(set) var businessDetailFeed: BusinessDetailViewModel!
    
    var onUpdate: ((Error?) -> Void)?
    
    init(apiClient: YelpAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchBusinessDetailWithID(id businessId:String, completion: @escaping (Error?) -> Void){
        
        self.apiClient.getBusinessDetails(businessId: businessId){ [weak self] result in
            
            switch result{
            case let .success(businessDetail):
                self?.businessDetailFeed =
                BusinessDetailViewModel(id:businessDetail.id,
                                        name: businessDetail.name,
                                        imageUrl: businessDetail.imageUrl,
                                        rating: businessDetail.rating,
                                        reviewCount: businessDetail.reviewCount,
                                        price: businessDetail.price,
                                        phone: businessDetail.phone,
                                        location: businessDetail.location.displayAddress.joined(separator: ","),
                                        photos: businessDetail.photos, isOpenNow: businessDetail.hours?[0].isOpenNow ?? false, categories: (self?.mapCategories(with: businessDetail.categories))!, todayOperatingHour: self?.getTodaysOperatingHours(hours:businessDetail.hours) ?? "")
                completion(nil)
    
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    private func mapCategories(with categories:[Category]) -> String {
        var catString:String!
        
        if !categories.isEmpty {
            catString = categories.map { $0.title }.joined(separator: ", ")
        } else {
            catString = "No Info"
        }
        
        return catString
    }
}


extension YelpBusinessDetailViewModel {
    
    func getTodaysOperatingHours(hours: [Hours]?) -> String {
        let today = Calendar.current.component(.weekday, from: Date()) - 1
        if let hours = hours?[0].open,
           let todayHours = hours.first(where: { $0.day == today }) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HHmm"
            let start = formatter.date(from: todayHours.start) ?? Date()
            let end = formatter.date(from: todayHours.end) ?? Date()
            formatter.dateFormat = "h:mm a"
            let startString = formatter.string(from: start)
            let endString = formatter.string(from: end)
            return "Today: \(startString) - \(endString)"
        } else {
            return "No Info"
        }
    }

    
}



