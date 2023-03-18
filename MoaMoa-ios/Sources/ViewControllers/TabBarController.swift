//
//  TabBarController.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    let exploreMembersTab = ExploreMembersViewController()
    let homeTab = HomeViewController()
    let myPageTab = MyPageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [exploreMembersTab, homeTab, myPageTab]
        tabBar.backgroundColor = .white
        delegate = self
        tabBar.tintColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        self.selectedIndex = 1

        // MARK: - explorePeopleTab
        exploreMembersTab.tabBarItem = UITabBarItem(title: "팀원탐색", image: UIImage(named: "ExploreSearchTabBar"), tag: 0)
//        ?? UIImage(), selectedImage: UIImage(named: "tabBarItem.timetable.fill") ?? UIImage())
        exploreMembersTab.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0.0)
        exploreMembersTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "", size: 12) ?? .systemFont(ofSize: 12)], for: .normal)

        // MARK: - homeTab
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "HomeTabBar"), tag: 1)
//        ?? UIImage(), selectedImage: UIImage(named: "tabBarItem.home.fill") ?? UIImage())
        homeTab.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0.0)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "", size: 12) ?? .systemFont(ofSize: 12)], for: .normal)

        // MARK: - myPageTab
        myPageTab.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(named: "MyPageTabBar"), tag: 2)
//        ?? UIImage(), selectedImage: UIImage(named: "tabBarItem.myPage.fill") ?? UIImage())
        myPageTab.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0.0)
        myPageTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "", size: 12) ?? .systemFont(ofSize: 12)], for: .normal)
    }
}
