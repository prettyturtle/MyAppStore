//
//  FeatureSectionView.swift
//  MyAppStore
//
//  Created by yc on 2021/12/18.
//

import UIKit
import SnapKit

class FeatureSectionView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            FeatureSectionCollectionViewCell.self,
            forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell"
        )
        
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FeatureSectionView {
    func setupLayout() {
        [
            collectionView,
            separatorView
        ].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(16.0)
            make.height.equalTo(snp.width)
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(16.0)
        }
    }
}

extension FeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath) as? FeatureSectionCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setupViews()
        
        return cell
    }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        return CGSize(width: width - 32.0, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32.0
    }
    
}
