//
//  SceneDelegate.swift
//  YelpiOSApp
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // According to the book Clean Code, we should NOT comment our code. The code itself should be easy to understand
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
        // In high scale companies, using storyboard is not seen as a good practice as it is difficult to maintain in git repos (lot of difficult merge conflicts). You should prefer ViewCode or SwiftUI
            let rootVC = storyboard.instantiateViewController(withIdentifier: "YelpHomeViewController")
        // If you are using storyboard, it would be cleaner to have aN UINavigationController from storyboard
            let navController = UINavigationController(rootViewController: rootVC)
            window.makeKeyAndVisible()
            window.rootViewController = navController
            window.makeKeyAndVisible()
            self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

