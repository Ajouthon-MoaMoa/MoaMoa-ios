//
//  UIViewController+Extension.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import Foundation
import UIKit

extension UIViewController {

    // 네비게이션 바 커스텀
    func setUpNavBar() {
        let backButton = UIBarButtonItem()
        backButton.tintColor = .black
        backButton.width = 30
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "", size: 16)!]
    }

    // collectionView의 Cell에서 다른 viewController로 이동할 때 주로 사용
    func pushView(viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.15
        transition.type = .fade
        view.window?.layer.add(transition, forKey: kCATransition)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    }

    func dismissView() {
        let transition = CATransition()
        transition.duration = 0.15
        transition.type = .fade
        transition.subtype = .none
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: true)
    }
}
