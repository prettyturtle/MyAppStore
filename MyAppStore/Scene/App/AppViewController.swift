//
//  AppViewController.swift
//  MyAppStore
//
//  Created by yc on 2021/12/17.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupLayout() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
