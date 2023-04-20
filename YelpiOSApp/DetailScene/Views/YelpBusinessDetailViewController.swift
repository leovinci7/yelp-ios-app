//
//  YelpBusinessDetailViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 20/4/23.
//

import Foundation
import UIKit

class YelpBusinessDetailViewController:UIViewController {
    
    @IBOutlet weak var mainBusinessImage: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessRating: UILabel!
    
    @IBOutlet weak var businessPriceCategory: UILabel!
    @IBOutlet weak var businessServiceCategory: UILabel!
    @IBOutlet weak var businessOpenStatus: UILabel!
    @IBOutlet weak var businessOperatingHour: UIStackView!
    
    var selectedItem:String?
    
    override func viewDidLoad() {
        
        title = "Detail"
        print("business detail view selected item: \(selectedItem ?? "")")
    }
    
    
}
