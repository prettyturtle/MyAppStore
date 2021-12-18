//
//  FeatureSectionCollectionViewCell.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class FeatureSectionCollectionViewCell: UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "typeLabel"
        label.font = .systemFont(ofSize: 12.0, weight: .semibold)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "appNameLabel"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "descriptionLabel"
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "mock")
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
}
extension FeatureSectionCollectionViewCell {
    func setupViews() {
        [
            typeLabel,
            appNameLabel,
            descriptionLabel,
            imageView
        ].forEach { addSubview($0) }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel.snp.leading)
            make.top.equalTo(typeLabel.snp.bottom)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel.snp.leading)
            make.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8.0)
            make.bottom.equalToSuperview().inset(8.0)
        }
        
    }
}
