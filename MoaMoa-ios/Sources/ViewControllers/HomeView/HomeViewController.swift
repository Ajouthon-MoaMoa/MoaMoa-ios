//
//  HomeViewController.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import SnapKit
import Then
import UIKit
import SwiftUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Properties

    lazy var scrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
       // $0.isPagingEnabled = true
       // $0.isScrollEnabled = true
    }
    lazy var profileView = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    
    lazy var firstBtn = UIButton().then {
        $0.setTitle("first", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.51, green: 0.33, blue: 1.0, alpha: 1.0)
        $0.layer.cornerRadius = 10
    }
    lazy var secondBtn = UIButton().then {
        $0.setTitle("second", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 10
    }
    lazy var thirdBtn = UIButton().then {
        $0.setTitle("third", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 10
    }
    lazy var titleLabel = UILabel().then {
        $0.text = "나만의 프로필을 만들고 팀원을 모아보세요."
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.numberOfLines = 2
    }
    lazy var realTimeTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        
    }
    
    //MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        realTimeTableView.delegate = self
        realTimeTableView.dataSource = self
        realTimeTableView.register(RealTimeCell.self, forCellReuseIdentifier: RealTimeCell.identifier)
        
        setUpView()
        setUpConstraints()
    }
    //MARK: - Helper

    func setUpView() {
        self.view.addSubview(scrollView)
        [titleLabel,profileView,realTimeTableView].forEach {
            view.addSubview($0)
        }
        [firstBtn,secondBtn,thirdBtn].forEach {
            scrollView.addSubview($0)
        }
        
    }
   
    func setUpConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 80)
        }
        profileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 100)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 120)
        }
        firstBtn.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(34)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.width.equalTo(Constant.width * 220)
            $0.height.equalTo(Constant.height * 120)
        }
        secondBtn.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(34)
            $0.leading.equalTo(firstBtn.snp.trailing).offset(10)
            $0.width.height.equalTo(firstBtn)

        }
        thirdBtn.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(34)
            $0.leading.equalTo(secondBtn.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(firstBtn)

        }
        realTimeTableView.snp.makeConstraints {
            $0.top.equalTo(firstBtn.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 300)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = realTimeTableView.dequeueReusableCell(withIdentifier: RealTimeCell.identifier, for: indexPath) as? RealTimeCell else { return UITableViewCell()}
        
        cell.title.text = "hello"
        cell.number.text = "333"

        cell.backgroundColor = .white
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//MARK: - swiftUI

struct MyViewController_PreViews: PreviewProvider {
static var previews: some View {
    HomeViewController().toPreview() //원하는 VC를 여기다 입력하면 된다.
}
}
extension UIViewController {
private struct Preview: UIViewControllerRepresentable {
        let HomeViewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return HomeViewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

func toPreview() -> some View {
    Preview(HomeViewController: self)
}
}

