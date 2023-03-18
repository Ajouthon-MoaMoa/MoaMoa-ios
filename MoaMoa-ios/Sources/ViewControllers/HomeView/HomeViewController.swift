//
//  HomeViewController.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import SnapKit
import Then
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setUpView()
        setUpConstraints()
    }

    func setUpView() {
        [].forEach {
            view.addSubview($0)
        }
    }

    func setUpConstraints() {
    }
}
