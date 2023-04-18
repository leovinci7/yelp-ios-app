//
//  YelpAPIProtocol.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

public enum SortBy: String {
    case bestMatch = "best_match"
    case rating = "rating"
    case reviewCount = "review_count"
    case distance = "distance"
}


public protocol YelpAPIClientProtocol {
    func searchBusinesses(term: String, longitude: Double?, latitude: Double?, location: String?, categories: String, sortBy: SortBy, limit: Int, completion: @escaping (Result<[Business], Error>) -> Void)
    
    func getBusinessDetails(businessId: String, completion: @escaping (Result<BusinessDetails, Error>) -> Void)
   }

