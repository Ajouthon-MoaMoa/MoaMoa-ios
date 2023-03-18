//
//  ExplorePeopleViewController.swift
//  MoaMoa-ios
//
//  Created by 김사랑 on 2023/03/18.
//

import SnapKit
import Then
import UIKit

class ExploreMembersViewController: UIViewController {

    let searchBarView = CommunitySearchBarView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let mainView = ExploreMembersView()

    //서버로 보낼 데이터들.
//    var profileImage: UIImage?
//    var nickname: String?
//    var date: String?
//    var major: String?
//    var content: String?
//    var tags: [String] = []

//    var tagData = [String]() // 태그 데이터 배열
//    var tagData: [String] = []

    var profileImage: [String] = ["Profile-small", "Profile-small", "Profile-small", "Profile-small", "Profile-small"]
    var nickname: [String] = ["김아주", "이아주", "강아주", "유아주", "장아주"]
    var major: [String] = ["불어불문학과", "소프트웨어학과", "경영학과", "미디어학과", "소프트웨어학과"]
    var content: [String] = ["파란학기제 참가하고 싶습니다ㅠㅠ 연락주세요", "이번학기에 캡스톤 팀원으로 데려가주실 분 구합니다,,", "파란학기제 프로젝트 참가 희망합니다\n아무거나 할게요", "파란학기제 참가 원합니다! ", "내용5"]
    var date: [String] = ["2023년 1월 7일", "2023년 1월 7일", "2023년 1월 7일", "2023년 1월 7일", "2023년 1월 7일"]

    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0

//    var tagCollectionView: UICollectionView = {
//        var layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        layout.sectionInset = .zero
//
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(TagCollectionViewCell.self,
//                                forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
//        cv.backgroundColor = .white
//        cv.showsHorizontalScrollIndicator = false
//        cv.isPagingEnabled = false
//        cv.decelerationRate = .fast
//        return cv
//        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
//        tagCollectionView.delegate = self
//        tagCollectionView.dataSource = self
        mainView.tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)

        setUpView()
        setUpConstraints()
    }

    func setUpView() {
        [mainView, searchBarView].forEach {
            view.addSubview($0)
        }
    }

    func setUpConstraints() {
        mainView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        searchBarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

// tableView
extension ExploreMembersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreMembersTableViewCell", for: indexPath) as! ExploreMembersTableViewCell
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
        searchBarView.searchTextField.endEditing(true)
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


//// MARK: - UICollectionViewDataSource
//
//extension ExploreMembersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tagData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCollectionViewCell
//        cell.backgroundColor = UIColor.white
//        cell.layer.cornerRadius = 10
//        cell.clipsToBounds = true
//        cell.tagNameLabel.text = tagData[indexPath.row]
//        return cell
//    }
//
//    // MARK: - UICollectionViewDelegateFlowLayout
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let tag = tagData[indexPath.row]
//        let size = tag.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)])
//        return CGSize(width: size.width + 20, height: 30)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // 선택된 Cell 가져오기
//        let cell = collectionView.cellForItem(at: indexPath) as! TagCollectionViewCell
//        // 선택된 Tag 가져오기
//        let tag = cell.tagNameLabel.text
//        // Tag 추가
////        addTag(tag: tag!)
//    }
//}
