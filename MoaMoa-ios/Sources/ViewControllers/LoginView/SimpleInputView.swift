//
//  SimpleInputView.swift
//  MoaMoa-ios
//
//  Created by HA on 2023/03/18.
//


import UIKit
import RxSwift
import RxCocoa
import RxRelay

class SimpleInputViewModel {
    // MARK: - Input
    let textfieldViewModel: BaseTextFieldViewModel
    
    init(textFieldViewModel: BaseTextFieldViewModel) {
        self.textfieldViewModel = textFieldViewModel
    }
}

class SimpleInputView: UIView {
    // MARK: Properties
    var disposeBag = DisposeBag()
    
    // MARK: - Binding
    func bind(to viewModel: SimpleInputViewModel) {
        textField.rx.controlEvent(.editingDidBegin)
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.textField.layer.borderColor = UIColor.appColor(.primary).cgColor
            }.disposed(by: disposeBag)
       
        textField.rx.controlEvent(.editingDidEnd)
            .asDriver()
            .drive(with: self) { owner, _ in
                owner.textField.layer.borderColor = UIColor.appColor(.빈인풋).cgColor
            }.disposed(by: disposeBag)
    }
    
    // MARK: Initializer
    init(viewModel: SimpleInputViewModel) {
        textField = BaseTextField(viewModel: viewModel.textfieldViewModel)
        super.init(frame: .zero)
        bind(to: viewModel)
        setUI()
        textField.setPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIComponents
    var textField: BaseTextField
    
    func setUI() {
        [textField].forEach { addSubview($0) }
        
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview()
        }
    }
}
