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
    }
    lazy var profileView = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
    }
    lazy var logoLabel = UILabel().then {
        $0.text = "M O A M O A"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        $0.textColor = UIColor(red: 0.5, green: 0.44, blue: 0.98, alpha: 1.0)
    }
    lazy var circleImageView = UIImageView().then {
        $0.backgroundColor = .systemGray3
        //$0.image = UIImage(named: "")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
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
    lazy var fourthBtn = UIButton().then {
        $0.setTitle("fourth", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemCyan
        $0.layer.cornerRadius = 10
    }
    lazy var titleLabel = UILabel().then {
        $0.text = "나만의 프로필을 만들고 팀원을 모아보세요!"
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.numberOfLines = 2
    }
    lazy var nameLabel = UILabel().then {
        $0.text = "홍길동"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    lazy var majorLabel = UILabel().then {
        $0.text = "소프트웨어학과"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
    lazy var subtitleLabel = UILabel().then {
        $0.text = "내가 찾고 싶은 사람"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    lazy var subtitle2Label = UILabel().then {
        $0.text = "실시간으로 협업하고 싶은 사람"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    lazy var realTimeTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
    }
    let borderView = UIView().then {
            $0.backgroundColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
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
        
        [titleLabel,profileView,realTimeTableView,subtitleLabel,subtitle2Label,logoLabel,borderView].forEach {
            view.addSubview($0)
        }
        [firstBtn,secondBtn,thirdBtn,fourthBtn].forEach {
            scrollView.addSubview($0)
        }
        [circleImageView, nameLabel,majorLabel].forEach {
            profileView.addSubview($0)
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
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 80)
        }
        profileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 80)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 120)
        }
        firstBtn.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.width.equalTo(Constant.width * 220)
            $0.height.equalTo(Constant.height * 120)
        }
        secondBtn.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(firstBtn.snp.trailing).offset(10)
            $0.width.height.equalTo(firstBtn)

        }
        thirdBtn.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(secondBtn.snp.trailing).offset(10)
            $0.width.height.equalTo(firstBtn)

        }
        fourthBtn.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(thirdBtn.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(firstBtn)

        }
        realTimeTableView.snp.makeConstraints {
            $0.top.equalTo(subtitle2Label.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 300)
        }
        circleImageView.snp.makeConstraints{
            $0.top.equalTo(profileView.snp.top).offset(15)
            $0.leading.equalTo(profileView.snp.leading).offset(15)
            $0.width.equalTo(Constant.width * 50)
            $0.height.equalTo(Constant.height * 50)
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(profileView.snp.top).offset(13)
            $0.leading.equalTo(circleImageView.snp.trailing).offset(20)
            $0.width.equalTo(Constant.width * 50)
            $0.height.equalTo(Constant.height * 20)
        }
        majorLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(13)
            $0.leading.equalTo(circleImageView.snp.trailing).offset(20)
            $0.width.equalTo(Constant.width * 100)
            $0.height.equalTo(Constant.height * 20)
        }
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(profileView.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 60)
        }
        subtitle2Label.snp.makeConstraints{
            $0.top.equalTo(firstBtn.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(37)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 60)
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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

