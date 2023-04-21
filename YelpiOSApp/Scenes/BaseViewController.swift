//
//  BaseViewController.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 21/4/23.
//
import UIKit

class BaseViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
