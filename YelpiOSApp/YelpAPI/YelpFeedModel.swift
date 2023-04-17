//
//  YelpModel.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//
struct YelpBusinessesResponse: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl: String
    let rating: Double
    let reviewCount: Int
    let location: Location
    
    private enum CodingKeys: String, CodingKey {
        case id, name, rating, location
        case imageUrl = "image_url"
        case reviewCount = "review_count"
    }
}

struct BusinessDetails: Codable {
    let id: String
    let name: String
    let imageUrl: String
    let rating: Double
    let reviewCount: Int
    let price: String?
    let phone: String
    let location: Location
    let photos: [String]?
    let categories: [Category]
    let hours: [Hours]?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, rating, location, phone, categories, hours, price, photos
        case imageUrl = "image_url"
        case reviewCount = "review_count"
    }
}

struct Location: Codable {
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

struct Category: Codable {
    let alias: String
    let title: String
}

struct Hours: Codable {
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

