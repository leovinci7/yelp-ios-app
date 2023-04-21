//
//  RatingHelper.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import Foundation

struct ViewHelper {
    
    public static func starRatingStringOld(rating: Double) -> String {
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
    
    public static func starRatingString(rating: Double) -> String {
        let fullStar = "★"
        let halfStar = "½"
        let emptyStar = "☆"
        
        let maxStars = 5
        
        let numberOfFullStars = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) >= 0.5
        
        var ratingString = String(repeating: fullStar, count: numberOfFullStars)
        
        if hasHalfStar {
            ratingString.append(halfStar)
        }
        
        let remainingEmptyStars = maxStars - numberOfFullStars - (hasHalfStar ? 1 : 0)
        ratingString.append(String(repeating: emptyStar, count: remainingEmptyStars))
        
        return ratingString
    }

    
}
