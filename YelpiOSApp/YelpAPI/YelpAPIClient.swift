//
//  YelpAPIClient.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

// URLSessionProtocol
public protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

// URLSession extension to conform URLSessionProtocol
extension URLSession: URLSessionProtocol { }

// YelpAPIClient
public class YelpAPIClient: YelpAPIClientProtocol {
    private let session: URLSessionProtocol
    private let baseURL = "https://api.yelp.com/v3/businesses"
    private let apiKey:String

    // Error Enum
    enum YelpErrors: Error {
        case networkError(Error)
        case apiError(Int)
        case invalidResponse
    }
    
    
   public init(session: URLSessionProtocol = URLSession.shared, apiKey:String) {
        self.session = session
        self.apiKey = apiKey
    }
    
    public func getBusinessDetails(businessId: String, completion: @escaping (Result<BusinessDetails, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/\(businessId)")!
        var request = URLRequest(url: url)
        request.addValue("Bearer \(self.apiKey)", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(YelpErrors.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(YelpErrors.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(YelpErrors.apiError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(YelpErrors.invalidResponse))
                return
            }
            
            do {
                let businessDetails = try JSONDecoder().decode(BusinessDetails.self, from: data)
                completion(.success(businessDetails))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    public func searchBusinesses(location: String, categories: String, sortBy: String, limit: Int, completion: @escaping (Result<[Business], Error>) -> Void) {
        var urlComponents = URLComponents(string: "\(baseURL)/search")!
        urlComponents.queryItems = [
            URLQueryItem(name: "location", value: location),
            URLQueryItem(name: "categories", value: categories),
            URLQueryItem(name: "sort_by", value: sortBy),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("Bearer \(self.apiKey)", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(YelpErrors.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(YelpErrors.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(YelpErrors.apiError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(YelpErrors.invalidResponse))
                return
            }
            
            do {
                let searchBusinessResponse = try JSONDecoder().decode(SearchBusinessesResponse.self, from: data)
                completion(.success(searchBusinessResponse.businesses))
                } catch {
                    completion(.failure(error))
            }
                
        }.resume()
    }
}
