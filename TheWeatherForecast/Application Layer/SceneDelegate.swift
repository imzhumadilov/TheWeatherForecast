//
//  SceneDelegate.swift
//  TheWeatherForecast
//
//  Created by Ilyas Zhumadilov on 26.09.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createRootViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    // MARK: - Module functions
    private func createRootViewController() -> UIViewController {
        
        let viewController = CitiesListConfigurator.create()
        CitiesListConfigurator.configure(with: viewController)
        
        let context = (UIApplication.shared.delegate as? AppDelegate)?
            .persistentContainer
            .viewContext

        if let context = context {
            let database = AddressRepository(context: context)
            viewController.database = database
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)

        let attributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 15)]
        UINavigationBar.appearance().titleTextAttributes = attributes as [NSAttributedString.Key: Any]
        
        return navigationController
    }
}

