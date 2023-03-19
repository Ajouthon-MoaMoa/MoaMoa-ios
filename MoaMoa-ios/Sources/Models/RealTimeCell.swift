//
//  RealTimeCell.swift
//  MoaMoa-ios
//
//  Created by HA on 2023/03/18.
//

import UIKit

import UIKit
import SnapKit
import Then

class RealTimeCell: UITableViewCell {

    static let cellIdentifier = "RealTimeCell"

    let baseView = UIView().then {
        $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1).cgColor
    }

    let profileImageBtn = UIButton()

    var profileImageView = UIImageView().then {
        $0.image = UIImage(named: "Profile-small")
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let nicknameLbl = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        $0.font = UIFont.notosans(size: 14, family: .bold)
    }

    let majorLbl = UILabel().then {
        $0.text = "학과"
        $0.textColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1)
        $0.font = UIFont.notosans(size: 14, family: .semiBold)
    }

    let dateLbl = UILabel().then {
        $0.text = "0000년 00월 00일"
        $0.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        $0.font =
        UIFont.notosans(size: 9, family: .regular)
    }

    let contentLbl = UILabel().then {
        $0.text = "내용"
        $0.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        $0.font = UIFont.notosans(size: 14, family: .regular)
        $0.numberOfLines = 3
    }
    
    lazy var contactBtn = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.layer.cornerRadius = 8
    }
    
    let contactLbl = UILabel().then {
        $0.text = "연락하기"
        $0.textColor = .white
        $0.font = UIFont.notosans(size: 16, family: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectedBackgroundView = UIView()
        setUpView()
        setUpConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func setUpView() {
        self.contentView.addSubview(baseView)
        [contactBtn, profileImageView, nicknameLbl, majorLbl, dateLbl, contentLbl].forEach {
            baseView.addSubview($0)
        }
        self.contactBtn.addSubview(contactLbl)
        self.profileImageView.addSubview(profileImageBtn)
    }

    func setUpConstraint() {
        baseView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        contactBtn.snp.makeConstraints {
            $0.centerY.equalTo(profileImageBtn)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(contactLbl).offset(20)
        }
        contactLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(28)
            $0.leading.equalTo(20)
            $0.height.equalTo(Constant.height * 40)
            $0.width.equalTo(Constant.width * 40)
        }
        profileImageBtn.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        nicknameLbl.snp.makeConstraints {
            $0.top.equalTo(28)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
        }
        majorLbl.snp.makeConstraints {
            $0.leading.equalTo(nicknameLbl.snp.leading)
            $0.bottom.equalTo(profileImageView.snp.bottom)
        }
        contentLbl.snp.makeConstraints {
            $0.top.equalTo(majorLbl.snp.bottom).offset(16)
            $0.leading.equalTo(majorLbl)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(63)
        }
        dateLbl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(15)
        }
    }

    @objc private func goToDetailPostBtnDidTap() {
    }
}
