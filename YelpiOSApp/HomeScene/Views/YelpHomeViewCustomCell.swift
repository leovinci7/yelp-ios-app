//
//  YelpHomeViewCustomCell.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import UIKit

final class YelpHomeViewCustomCell: UITableViewCell {

    @IBOutlet private(set) var locationContainer:UIView!
    @IBOutlet private(set) var locationLabel:UIView!
    @IBOutlet private(set) var businessImageView:UIView!
    @IBOutlet private(set) var descriptionLabel:UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
