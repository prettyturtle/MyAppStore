//
//  TodayCollectionViewCell.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class TodayCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        titleLabel.text = "title"
        subTitleLabel.text = "subTitle"
        descriptionLabel.text = "description"
        imageView.image = UIImage(systemName: "applelogo")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TodayCollectionViewCell {
    func setupViews() {
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
