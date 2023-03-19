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
    //MARK: - Properties
    
    let mainView = HomeMembersView()

    var profileImage: [String] = ["1", "2", "3", "4", "5"]
    var nickname: [String] = ["포로리", "너부리", "보노보노", "도라에몽", "퉁퉁이"]
    var major: [String] = ["건축학과", "기계공학과", "전자공학과", "소프트웨어학과", "미디어학과"]
    var content: [String] = ["파란학기제 참가하고 싶습니다ㅠㅠ 연락주세요", "이번학기에 캡스톤 팀원으로 데려가주실 분 구합니다,,", "파란학기제 프로젝트 참가 희망합니다\n아무거나 할게요", "파란학기제 참가 원합니다! ", "내용5"]
    var date: [String] = ["2023년 2월 15일", "2023년 2월 13일", "2023년 2월 11일", "2023년 2월 10일", "2023년 2월 8일"]

    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0

    lazy var scrollView = UIScrollView().then {
        $0.backgroundColor = .systemGray6
        $0.showsHorizontalScrollIndicator = false
    }
    lazy var profileView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    lazy var logoLabel = UILabel().then {
        $0.text = "M O A M O A"
//        $0.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        $0.font = UIFont.notosans(size: 30, family: .semiBold)
        $0.textColor = UIColor(red: 0.5, green: 0.44, blue: 0.98, alpha: 1.0)
    }
    lazy var circleImageView = UIImageView().then {
        $0.backgroundColor = .systemGray3
        $0.image = UIImage(named: "hello")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
    }
    
    lazy var firstBtn = UIButton().then {
        $0.setTitle("파란 학기 팀원 구해요~", for: .normal)
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    lazy var secondBtn = UIButton().then {
        $0.setTitle("학과별로 모아~", for: .normal)
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    lazy var thirdBtn = UIButton().then {
        $0.setTitle("내가 관심있는 분야는?", for: .normal)
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    lazy var fourthBtn = UIButton().then {
        $0.setTitle("졸업 작품 같이 해보자~", for: .normal)
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.502, green: 0.443, blue: 0.988, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    lazy var titleLabel = UILabel().then {
        $0.text = "나만의 프로필을 만들고 팀원을 모아보세요!"
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.numberOfLines = 2
    }
    lazy var nameLabel = UILabel().then {
        $0.text = "라이언"
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
        self.view.backgroundColor = .systemGray6
        mainView.tableView.backgroundColor = .systemGray6
//        realTimeTableView.delegate = self
//        realTimeTableView.dataSource = self
//        realTimeTableView.register(RealTimeCell.self, forCellReuseIdentifier: RealTimeCell.identifier)
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)

        
        setUpView()
        setUpConstraints()
    }
    //MARK: - Helper
    
    func setUpView() {
        self.view.addSubview(scrollView)
        
        [titleLabel,profileView,mainView,subtitleLabel,subtitle2Label,logoLabel,borderView].forEach {
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
            $0.top.equalTo(logoLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 80)
        }
        profileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.width.equalTo(Constant.width * 315)
            $0.height.equalTo(Constant.height * 80)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(12)
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
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 60)
        }
        subtitle2Label.snp.makeConstraints{
            $0.top.equalTo(firstBtn.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.width.equalTo(Constant.width * 290)
            $0.height.equalTo(Constant.height * 60)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(subtitle2Label.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalToSuperview()
            
//            $0.width.equalTo(Constant.width * 315)
//            $0.height.equalTo(Constant.height * 300)
        }
    }
}

// tableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeCell", for: indexPath) as! RealTimeCell
        cell.profileImageView.image = UIImage(named: profileImage[indexPath.row])
        cell.nicknameLbl.text = nickname[indexPath.row]
        cell.majorLbl.text = major[indexPath.row]
        cell.contentLbl.text = content[indexPath.row]
        cell.dateLbl.text = date[indexPath.row]

        cell.backgroundColor = UIColor.clear
        cell.clipsToBounds = true

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if mainView.visibleCells.contains(indexPath.section) {
            // visibleCells 배열에 저장된 인덱스에 해당하는 cell만 보이도록 합니다.
            cell.isHidden = true
        } else {
            cell.isHidden = false
        }
    }
}



class HomeMembersView: UIView {

    var visibleCells: [Int] = []

    let tableView = UITableView().then{

        $0.showsVerticalScrollIndicator = false
//        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
//        $0.backgroundColor = .blue

        $0.register(RealTimeCell.self, forCellReuseIdentifier: RealTimeCell.cellIdentifier)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(tableView)

        tableView.separatorStyle = .none
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }

        // MARK: 테이블뷰 헤더 간격 없앰
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
