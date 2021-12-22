//
//  AppDetailViewController.swift
//  MyAppStore
//
//  Created by yc on 2021/12/19.
//

import UIKit
import SnapKit

class AppDetailViewController: UIViewController {
    
    private let today: Today
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 8.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    init(today: Today) {
        self.today = today

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupViews()
    }
}

private extension AppDetailViewController {
    func setupViews() {
        setupLayout()
        
        titleLabel.text = today.title
        subTitleLabel.text = today.subTitle
        
        if let imageURL = URL(string: today.imageURL) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    func setupLayout() {
        [
            imageView,
            titleLabel,
            subTitleLabel,
            downloadButton,
            shareButton
        ].forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.0)
            make.top.equalToSuperview().inset(32.0)
            make.width.height.equalTo(100.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(16.0)
            make.top.equalTo(imageView.snp.top)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.width.equalTo(60.0)
            make.height.equalTo(24.0)
            make.leading.equalTo(titleLabel.snp.leading)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        shareButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16.0)
            make.centerY.equalTo(downloadButton.snp.centerY)
            make.width.height.equalTo(32.0)
        }
    }
}

