//
//  YelpHomeViewCustomCell.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import UIKit
import SDWebImage

final class YelpHomeViewCustomCell: UITableViewCell {

    @IBOutlet private(set) var locationContainer:UIView!
    @IBOutlet private(set) var locationLabel:UILabel!
    @IBOutlet private(set) var nameLabel:UILabel!
    @IBOutlet private(set) var businessImageView:UIImageView!
    @IBOutlet private(set) var descriptionLabel:UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func fadeIn() {
        self.businessImageView.alpha = 0
            UIView.animate(
                withDuration: 0.3,
                delay: 0.2,
                animations: {
                    self.businessImageView.alpha = 1
            })
        }
    
}

extension YelpHomeViewCustomCell {
    func configure(with model: BusinessViewModel){
        locationLabel.text = model.location
        nameLabel.text = model.name
        //descriptionLabel.text = ViewHelper.starRatingString(rating: model.rating)
        descriptionLabel.text = "★ \(String(model.rating)) (\(model.reviewCount) Reviews)"
       // businessImageView.image = UIImage(named: model.imageUrl)
        businessImageView.sd_setImage(with: URL(string: model.imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
        businessImageView.contentMode = .scaleAspectFill
    
        
    }
}
