//
//  RulesView.swift
//  AliasApp
//
//  Created by NaYfront on 26.05.2023.
//

import UIKit

class RulesView: UIView {
    
    // MARK: - User Interface
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    public lazy var paragraphsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .generalYellow
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    public lazy var pageControl: CHIPageControlAleppo = {
        let pageControl = CHIPageControlAleppo(frame: CGRect(x: 0, y:0, width: 100, height: 20))
        pageControl.numberOfPages = 4
        pageControl.radius = 4
        pageControl.tintColor = .white
        pageControl.currentPageTintColor = .generalPurple
        pageControl.padding = 6
        pageControl.enableTouchEvents = true
        
        return pageControl
    }()
    
    
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .generalYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure() {
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        addSubview(paragraphsCollectionView)
        paragraphsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.right.left.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(paragraphsCollectionView.snp.bottom).inset(20)
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(30)
        }
    }
}
