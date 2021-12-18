//
//  RankingFeatureCollectionViewCell.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class RankingFeatureCollectionViewCell: UICollectionViewCell {
    
    static var height: CGFloat { 80.0 }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel

        return label
    }()
    
    func setup() {
        setupLayout()
        
        titleLabel.text = "App Name"
        descriptionLabel.text = "App Description"
        imageView.image = UIImage(named: "mock")
        inAppPurchaseInfoLabel.isHidden = [true, false].randomElement()!
    }
    
}

private extension RankingFeatureCollectionViewCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            downloadButton,
            inAppPurchaseInfoLabel
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(4.0)
            make.height.equalTo(imageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8.0)
            make.top.equalToSuperview().inset(8.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.width.equalTo(50.0)
            make.height.equalTo(24.0)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(downloadButton.snp.bottom).offset(4.0)
            make.centerX.equalTo(downloadButton.snp.centerX)
        }
    }
}
