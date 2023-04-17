//
//  YelpModel.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//
public struct SearchBusinessesResponse: Codable {
    let businesses: [Business]
}

public struct Business: Codable {
    public let id: String
    public let name: String
    public let imageUrl: String
    public let rating: Double
    public let reviewCount: Int
    public let location: Location
    
    private enum CodingKeys: String, CodingKey {
        case id, name, rating, location
        case imageUrl = "image_url"
        case reviewCount = "review_count"
    }
}

public struct BusinessDetails: Codable {
    public let id: String
    public let name: String
    public let imageUrl: String
    public let rating: Double
    public let reviewCount: Int
    public let price: String?
    public let phone: String
    public let location: Location
    public let photos: [String]?
    public let categories: [Category]
    public let hours: [Hours]?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, rating, location, phone, categories, hours, price, photos
        case imageUrl = "image_url"
        case reviewCount = "review_count"
    }
}

public struct Location: Codable {
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let zipCode: String
    let country: String
    let state: String
    let displayAddress: [String]
    
    private enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city
        case zipCode = "zip_code"
        case country, state
        case displayAddress = "display_address"
    }
}

public struct Category: Codable {
    let alias: String
    let title: String
}

public struct Hours: Codable {
    let open: [OpenHours]
    let hoursType: String
    let isOpenNow: Bool
    
    private enum CodingKeys: String, CodingKey {
        case open
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
}

struct OpenHours: Codable {
    let isOvernight: Bool
    let start: String
    let end: String
    let day: Int
    
    private enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start, end, day
    }
}

