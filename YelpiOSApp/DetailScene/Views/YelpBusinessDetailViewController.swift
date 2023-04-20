//
//  YelpBusinessDetailViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 20/4/23.
//

import Foundation
import UIKit

class YelpBusinessDetailViewController:UIViewController {
    
    var selectedItem:String?
    
    override func viewDidLoad() {
        
        title = "Detail"
        print("business detail view selected item: \(selectedItem ?? "")")
    }
    
    
}
