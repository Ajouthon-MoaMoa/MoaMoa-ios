//
//  StatsView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class ResumeView: UIView {
    
    let titleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "이력서", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont.notosans(size: 20, family: .bold)
    }
    
    let mainView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 0.17)
        $0.layer.cornerRadius = 15
    }
    
    let resumeTitleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "안녕하세요 성장하는 개발자를 꿈꾸고 있습니다.", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont.notosans(size: 16, family: .semiBold)
    }
    
    let resumeContentLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "저는 Java, Python 및 C++와 같은 다양한 프로그래밍 언어를 사용하여 소프트웨어 애플리케이션을 설계, 개발 및 테스트하는 데 관심을 가지고 있습니다. 저는 성공적인 개발을 위해 팀을 찾고있습니다.", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont.notosans(size: 16, family: .regular)
        $0.numberOfLines = 0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        [titleLbl, mainView].forEach {
            addSubview($0)
        }
        [resumeTitleLbl, resumeContentLbl].forEach {
            mainView.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(16)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(Constant.height * 200)
//            $0.bottom.equalToSuperview()
        }
        resumeTitleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        resumeContentLbl.snp.makeConstraints {
            $0.top.equalTo(resumeTitleLbl.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(resumeTitleLbl)
        }
    }
}
