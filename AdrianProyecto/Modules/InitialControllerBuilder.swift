//
//  InitialControllerBuilder.swift
//  AdrianProyecto
//
//  Created by Adrian Iraizos Mendoza on 28/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
        let tabBarController = UITabBarController()
        let viewControllers = [buildMain(),buildList(),buildForm()]
        tabBarController.setViewControllers(viewControllers, animated: true)
        
        return tabBarController
    }
}


private extension InitialControllerBuilder {
    func buildForm() -> UIViewController {
        let viewController = FormControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Form", image: UIImage(systemName: "person.badge.plus"), tag: 1)
        return navigationController
    }
}


private extension InitialControllerBuilder {
    func buildList() -> UINavigationController {
        let viewController = ListControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.star"), tag: 2)
        return navigationController
    }
}

private extension InitialControllerBuilder {
    func buildMain() -> UINavigationController {
        let viewController = MainControllerBuilder().build()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "bolt.fill"), tag: 0)
      
        return navigationController
    }
}
