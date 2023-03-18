//
//  MyPageViewController.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import SnapKit
import Then
import UIKit

class MyPageViewController: UIViewController {
    //MARK: - Properties
    lazy var logoLabel = UILabel().then {
        $0.text = "M O A M O A"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        $0.textColor = UIColor(red: 0.5, green: 0.44, blue: 0.98, alpha: 1.0)
    }
    
    let borderView = UIView().then {
            $0.backgroundColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
    }
    lazy var circle1ImageView = UIImageView().then {
        $0.backgroundColor = .systemGray3
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50
    }
    lazy var circleImageView = UIImageView().then {
        $0.backgroundColor = .systemGray3
        $0.image = UIImage(named: "hello")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 45
    }
    
    lazy var nameLabel = UILabel().then {
        $0.text = "홍길동"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    lazy var majorLabel = UILabel().then {
        $0.text = "소프트웨어학과"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    
    //MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUpNavBar()
        setUpView()
        setUpConstraints()
    }
    //MARK: - Helper

    func setUpView() {
        [logoLabel, borderView,circle1ImageView,circleImageView,nameLabel,majorLabel].forEach {
            view.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.centerX.equalToSuperview()
        }
        borderView.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(15)
            $0.height.equalTo(Constant.height * 0.5)
            $0.leading.trailing.equalToSuperview()
        }
        circle1ImageView.snp.makeConstraints{
            $0.top.equalTo(borderView.snp.top).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constant.width * 100)
            $0.height.equalTo(Constant.height * 100)
        }
        
        circleImageView.snp.makeConstraints{
            $0.top.equalTo(borderView.snp.top).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Constant.width * 90)
            $0.height.equalTo(Constant.height * 90)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(circleImageView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            
        }
        
        majorLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            
        }
    }
    
}
