//
//  YelpBusinessDetailViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 20/4/23.
//

import Foundation
import UIKit
import SDWebImage

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
    
    var selectedItem:String!
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key)
    var viewModel:YelpBusinessDetailViewModel!
    
    override func viewDidLoad() {
        
        title = "Detail"
        print("business detail view selected item: \(selectedItem ?? "")")
        viewModel = YelpBusinessDetailViewModel(apiClient: self.yelpAPIClient)
        
        viewModel.fetchBusinessDetailWithID(id: self.selectedItem){ error in
            if let error = error {
                print(error.localizedDescription)
            }else {
                DispatchQueue.main.async { [weak self] in
                    let businessDetailFeed = self?.viewModel.businessDetailFeed
                    self?.businessName.text = businessDetailFeed?.name
                    self?.mainBusinessImage.sd_setImage(with: URL(string: businessDetailFeed?.imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                }
                
            }
            
        }
        
    }
    
    
}
