//
//  SeparatorView.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class SeparatorView: UIView {
    private lazy var separator: UIView = {
        let separator = UIView()
        
        separator.backgroundColor = .separator
        
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separator)
        
        separator.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.top.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
