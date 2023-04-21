//
//  YelpBusinessDetailViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 20/4/23.
//

import Foundation
import UIKit
import SDWebImage

class YelpBusinessDetailViewController:BaseViewController {
    
    @IBOutlet weak var mainBusinessImage: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessRating: UILabel!
    
    @IBOutlet weak var businessPriceCategory: UILabel!
    @IBOutlet weak var businessServiceCategory: UILabel!
    @IBOutlet weak var businessOpenStatus: UILabel!
    @IBOutlet weak var businessOperatingHour: UILabel!
    
    @IBOutlet weak var businessDisplayAddress: UILabel!
    var selectedItem:String!
    var yelpAPIClient = YelpAPIClient(apiKey: APIKey.key)
    var viewModel:YelpBusinessDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        print("business detail view selected item: \(selectedItem ?? "")")
        viewModel = YelpBusinessDetailViewModel(apiClient: self.yelpAPIClient)
        configureDetailView()

    }
    
}




extension YelpBusinessDetailViewController {
    func configureDetailView(){
        activityIndicator.startAnimating()
        viewModel.fetchBusinessDetailWithID(id: self.selectedItem){ [weak self] error in
            if let error = error {
                print(error.localizedDescription)
                self?.activityIndicator.stopAnimating()
            }else {
                DispatchQueue.main.async { [weak self] in
                    let businessDetailFeed = self?.viewModel.businessDetailFeed
                    
                    
                    self?.businessName.text = businessDetailFeed?.name
                    self?.mainBusinessImage.sd_setImage(with: URL(string: businessDetailFeed?.imageUrl ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                    self?.mainBusinessImage.fadeIn()
                    
                    self?.businessRating.text = ViewHelper.starRatingString(rating: businessDetailFeed!.rating)
                    self?.businessRating.fadeIn()
                    
                    if let openStatus = businessDetailFeed?.isOpenNow {
                        self?.businessOpenStatus.text = openStatus ? "Open" : "Closed"
                        self?.businessOpenStatus.textColor = openStatus ? .green : .red
                    } else {
                        self?.businessOpenStatus.text = "No Info"
                        self?.businessOpenStatus.textColor = .red
                    }
                    
                    
                    // Load photos into imageOne, imageTwo, and imageThree
                    if let photos = businessDetailFeed?.photos {
                        if let imageView = self?.imageOne, photos.indices.contains(0) {
                            imageView.sd_setImage(with: URL(string: photos[0]), placeholderImage: UIImage(named: "placeholder.png"))
                            imageView.fadeIn()
                        }
                        if let imageView = self?.imageTwo, photos.indices.contains(1) {
                            imageView.sd_setImage(with: URL(string: photos[1]), placeholderImage: UIImage(named: "placeholder.png"))
                            imageView.fadeIn()
                        }
                        if let imageView = self?.imageThree, photos.indices.contains(2) {
                            imageView.sd_setImage(with: URL(string: photos[2]), placeholderImage: UIImage(named: "placeholder.png"))
                            imageView.fadeIn()
                        }
                        self?.activityIndicator.stopAnimating()
                    }
                    
                    // Display category
                    self?.businessServiceCategory.text = businessDetailFeed?.categories
                    
                    // Display price
                    self?.businessPriceCategory.text = businessDetailFeed?.price ?? "No Info"
                    
                    self?.businessOperatingHour.text = businessDetailFeed?.todayOperatingHour
                    
                    self?.businessDisplayAddress.text = businessDetailFeed?.location
                    
                }
                
            }
            
        }
    }
}

extension UIView {
    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0.2) {
        self.alpha = 0
        UIView.animate(
            withDuration: duration,
            delay: delay,
            animations: {
                self.alpha = 1
        })
    }
}
