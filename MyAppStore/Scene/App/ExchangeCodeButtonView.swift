//
//  ExchangeCodeButtonView.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class ExchangeCodeButtonView: UIView {
    
    private lazy var exchangeCodeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("코드 교환", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 7.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(exchangeCodeButton)
        
        exchangeCodeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.top.bottom.equalToSuperview().inset(32.0)
            make.height.equalTo(40.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
