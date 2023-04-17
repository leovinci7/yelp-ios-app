//
//  YelpHomeViewCustomCell.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import UIKit

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
    
}

extension YelpHomeViewCustomCell {
    func configure(with model: BusinessViewModel){
        locationLabel.text = model.location
        nameLabel.text = model.name
        //locationContainer.isHidden = model.location == nil
        descriptionLabel.text = ViewHelper.starRatingString(rating: model.rating)
       // businessImageView.image = UIImage(named: model.imageUrl)
    
    }
}
