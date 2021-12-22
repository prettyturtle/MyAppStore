//
//  TodayCollectionViewCell.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit
import Kingfisher

class TodayCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        
        return imageView
    }()
}

extension TodayCollectionViewCell {
    func setupView(today: Today) {
        setupLayout()
        
        titleLabel.text = "\(today.title)"
        subTitleLabel.text = "\(today.subTitle)"
        descriptionLabel.text = "\(today.description)"
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
        
    }
    
    func setupLayout() {
        [
            imageView,
            subTitleLabel,
            titleLabel,
            descriptionLabel,
            
        ].forEach { addSubview($0) }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(subTitleLabel.snp.leading)
            make.trailing.equalTo(subTitleLabel.snp.trailing)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(24.0)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
