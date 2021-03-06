//
//  TodayCollectionViewHeaderView.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class TodayCollectionHeaderView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일 EEEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let convertDate = dateFormatter.string(from: Date.now)
        
        label.text = "\(convertDate)"
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setupViews() {
        
        [
            dateLabel,
            titleLabel
        ].forEach { addSubview($0) }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8.0)
            make.leading.equalTo(dateLabel.snp.leading)
        }
    }
}
