//
//  UITabBarController.swift
//  Movie
//
//  Created by siuzanna on 17/12/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        viewControllers = TabBar.allCases.map {$0.viewController}
        tabBar.barTintColor = .white
        addCustomTabBarView()
        hideTabBarBorder()
        self.selectedIndex = 0
        self.delegate = self
        self.tabBar.tintColor = Colors.logoRed.color
        self.tabBar.unselectedItemTintColor = Colors.icons.color
    }
     
    let customTabBarView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Colors.tabbar.color
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBarView.frame = tabBar.frame
    }

    func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        tabBar.layer.masksToBounds = false
    }
}

enum TabBar: String, CaseIterable {
    
    case home
    case explore
    case bookmark
    case user
    
    var viewController: UINavigationController {
        var vc = UINavigationController()
        switch self {
            case .home:
                vc = UINavigationController(rootViewController: ViewController())
            case .explore:
                vc = UINavigationController(rootViewController: ViewController())
            case .bookmark:
                vc = UINavigationController(rootViewController: ViewController())
            case .user:
                vc = UINavigationController(rootViewController: ViewController())
        }
        
        vc.setNavigationBarHidden(true, animated: true)
        vc.tabBarItem = tabBarItem
        vc.tabBarItem.imageInsets.top = 5
        return vc
    }
    
    var tabBarItem: UITabBarItem{
        switch self {
            case .home:
                return .init(title: nil,
                             image: UIImage(named: TabBar.home.rawValue),
                             selectedImage: UIImage(named: TabBar.home.rawValue))
            case .explore:
                return .init(title: nil,
                             image: UIImage(named: TabBar.explore.rawValue),
                             selectedImage: UIImage(named: TabBar.explore.rawValue))
            case .bookmark:
                return .init(title: nil,
                             image: UIImage(named: TabBar.bookmark.rawValue),
                             selectedImage: UIImage(named: TabBar.bookmark.rawValue))
                
            case .user:
                return .init(title: nil,
                             image: UIImage(named: TabBar.user.rawValue),
                             selectedImage: UIImage(named: TabBar.user.rawValue))
        }
    }
}
