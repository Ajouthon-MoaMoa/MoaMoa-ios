//
//  CommunitySearchBarView.swift
//  CatchEx_Practice
//
//  Created by 김사랑 on 2023/01/07.
//

import UIKit
import SnapKit
import Then

class CommunitySearchBarView: UIView, UITextFieldDelegate, UITextViewDelegate {


    let mainView = ExploreMembersView()
    var visibleCells: [Int] = []

    let searchTextField = UITextField().then {
        $0.font = UIFont.notosans(size: 16, family: .regular)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.tintColor = .black
    }

    lazy var searchBtn = UIButton().then {
        $0.setImage(UIImage(named: "SearchBar"), for: .normal)
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .regular), forImageIn: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(searchBtnDidTap), for: .touchUpInside)
    }

    let paranLabel = UILabel().then {
        $0.text = "파란학기"
        $0.textColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.font = UIFont.notosans(size: 13, family: .regular)
    }
    
    lazy var paranBtn = UIButton().then {
        $0.backgroundColor = .white
//        $0.layer.borderColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1).cgColor
//        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.tag = 0
    }

    let capstoneLabel = UILabel().then {
        $0.text = "캡스톤디자인"
        $0.textColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.font = UIFont.notosans(size: 13, family: .regular)
    }

    lazy var capstoneBtn = UIButton().then {
        $0.backgroundColor = .white
//        $0.layer.borderColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1).cgColor
//        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.tag = 1
    }
                               
    let sideProjectsLabel = UILabel().then {
        $0.text = "사이드프로젝트"
        $0.textColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.font = UIFont.notosans(size: 13, family: .regular)
    }

    lazy var sideProjectsBtn = UIButton().then {
        $0.backgroundColor = .white
//        $0.layer.borderColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1).cgColor
//        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.tag = 2
    }

    let othersLabel = UILabel().then {
        $0.text = "기타"
        $0.textColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.font = UIFont.notosans(size: 13, family: .regular)
    }

    lazy var othersBtn = UIButton().then {
        $0.backgroundColor = .white
//        $0.layer.borderColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1).cgColor
//        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.tag = 3
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면을 누르면 키보드 내려가게 하는 것
        self.endEditing(true)
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
        addSubview(searchTextField)
        searchTextField.addSubview(searchBtn)
        [paranBtn, capstoneBtn, othersBtn].forEach {
            addSubview($0)
        }
        paranBtn.addSubview(paranLabel)
        capstoneBtn.addSubview(capstoneLabel)
        othersBtn.addSubview(othersLabel)
        searchTextField.addLeftPadding()
        textFieldDidBeginEditing(searchTextField)
        textFieldDidEndEditing(searchTextField)

        paranBtn.addTarget(self, action: #selector(tagButtonPressed(_:)), for: .touchUpInside)
        paranBtn.isSelected = false

//        paranBtn.addTarget(self, action: #selector(tagButtonPressed), for: .touchUpInside)
        capstoneBtn.addTarget(self, action: #selector(tagButtonPressed), for: .touchUpInside)
        othersBtn.addTarget(self, action: #selector(tagButtonPressed), for: .touchUpInside)
    }

    func setUpConstraints() {
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(Constant.height * 40)
        }
        searchBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9.8)
            $0.trailing.equalToSuperview().inset(13.8)
        }
        paranLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
//            $0.leading.trailing.equalToSuperview().inset(5)
        }
        capstoneLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        othersLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        paranBtn.snp.makeConstraints {
            $0.leading.equalTo(searchTextField)
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.height.equalTo(Constant.height * 26)
            $0.width.equalTo(paranLabel).offset(20)
            $0.bottom.equalToSuperview().inset(16)
        }
        capstoneBtn.snp.makeConstraints {
            $0.leading.equalTo(paranBtn.snp.trailing).offset(10)
            $0.centerY.equalTo(paranBtn)
            $0.height.equalTo(paranBtn)
            $0.width.equalTo(capstoneLabel).offset(20)
        }/*
        sideProjectsBtn.snp.makeConstraints {
            $0.leading.equalTo(capstoneBtn.snp.trailing).offset(10)
            $0.centerY.equalTo(capstoneBtn)
            $0.height.equalTo(capstoneBtn)
            $0.width.equalTo(sideProjectsLabel).offset(20)
        }*/
        othersBtn.snp.makeConstraints {
            $0.leading.equalTo(capstoneBtn.snp.trailing).offset(10)
            $0.centerY.equalTo(capstoneBtn)
            $0.height.equalTo(capstoneBtn)
            $0.width.equalTo(othersLabel).offset(20)
        }
    }

    @IBAction func tagButtonPressed(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected // 버튼의 isSelected 속성 반전

        if sender.isSelected {
            sender.layer.backgroundColor = UIColor(red: 0.941, green: 0.933, blue: 1, alpha: 1).cgColor
        } else {
            sender.backgroundColor = .white
        }

        if sender == paranBtn {
            mainView.visibleCells = [2] // 세 번째 cell의 인덱스를 저장합니다.
            mainView.tableView.reloadData() // tableView를 갱신합니다.
        }
        mainView.tableView.reloadData() // tableView를 갱신합니다.
    }

    // MARK: 텍스트필드 커스텀
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {

//        // 텍스트필드 입력 시 테두리 생기게 하기
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor(red: 0.188, green: 0.188, blue: 0.188, alpha: 1).cgColor

        // 초기 탭 시, 텍스트필드 비우기 (1)
        textField.placeholder = nil
    }

    @objc func textFieldDidEndEditing(_ textField: UITextField) {

        // 초기 탭 시, 텍스트필드 비우기 (2)
        textField.placeholder = "검색어를 입력해주세요"
        textField.attributedPlaceholder = NSAttributedString(
            string: "검색어를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)]
        )
    }
    
    @objc private func searchBtnDidTap() {
    }
}

// MARK: 텍스트필드 왼쪽 간격 주기 -> 패딩에서 텍스트 입력 시작
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
