//
//  YelpAPIProtocol.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation


public protocol YelpAPIClientProtocol {
    func searchBusinesses(term: String, longitude: Double?, latitude: Double?, location: String?, categories: String, sortBy: String, limit: Int, completion: @escaping (Result<[Business], Error>) -> Void)
    
    func getBusinessDetails(businessId: String, completion: @escaping (Result<BusinessDetails, Error>) -> Void)
   }

