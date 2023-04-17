//
//  RatingHelper.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

struct ViewHelper {
    
    public static func starRatingString(rating: Double) -> String {
        let fullStar = "★"
        let halfStar = "☆"
        
        let numberOfFullStars = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) >= 0.5
        
        var ratingString = String(repeating: fullStar, count: numberOfFullStars)
        if hasHalfStar {
            ratingString.append(halfStar)
        }
        
        return ratingString
    }
    
}
