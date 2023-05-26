//
//  RulesViewController.swift
//  AliasApp
//
//  Created by NaYfront on 24.05.2023.
//

import UIKit
import SnapKit

class RulesViewController: UIViewController {
    
    // MARK: - Properties
    private var paragraphs: [Paragraph] = []
    
    private lazy var mainView = RulesView()
    
    var viewModel: RulesViewModel!
    
    // MARK: - UI
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Правила"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()
    
    // MARK: - Initializers
    init(withViewModel viewModel: RulesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func loadView() {
        view = mainView
    }
    
    // MARK: - Configuration
    private func configure() {
        getData()
        mainView.configure()
        setupNavigationController()
        
        mainView.paragraphsCollectionView.delegate = self
        mainView.paragraphsCollectionView.dataSource = self
        mainView.paragraphsCollectionView.register(ParagraphCollectionViewCell.self, forCellWithReuseIdentifier: "ParagraphCollectionViewCell")
    }
    
    // MARK: - Private Functions
    private func getData() {
        self.paragraphs = Paragraph.paragraphs
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.titleView = titleView
    }
}

// MARK: - UICollectionViewDataSource
extension RulesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.paragraphsCollectionView.dequeueReusableCell(withReuseIdentifier: "ParagraphCollectionViewCell", for: indexPath) as? ParagraphCollectionViewCell else { return UICollectionViewCell() }
        
        let paragraph = paragraphs[indexPath.row]
        cell.configure(with: paragraph)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension RulesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailVC = DetailViewController(event: events[indexPath.row])
//
//        let fullTitle = events[indexPath.row].name
//        let index = fullTitle.index(fullTitle.startIndex, offsetBy: 20)
//        let title = String("\(fullTitle[..<index])...")
//
//        detailVC.navigationItem.title = title
//
//        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        mainView.pageControl.set(progress: indexPath.row, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RulesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
}
