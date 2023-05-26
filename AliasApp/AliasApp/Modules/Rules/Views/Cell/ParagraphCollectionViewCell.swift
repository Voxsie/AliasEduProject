//
//  ParagraphCollectionViewCell.swift
//  AliasApp
//
//  Created by NaYfront on 26.05.2023.
//

import UIKit

class ParagraphCollectionViewCell: UICollectionViewCell {
    // MARK: - User Interface
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalBlack
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = .TTCommonsBlack(size: 25)
        
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalBlack
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.font = .TTCommons(type: .regular, size: 20)
        
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, textLabel])
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        sv.spacing = 5
        
        return sv
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure(with paragraph: Paragraph) {
        
        mainImageView.image = UIImage(named: paragraph.image)
        titleLabel.text = paragraph.title
        textLabel.text = paragraph.text
    }
    
    // MARK: - Private Functions
    private func makeUI() {
        backgroundColor = .generalYellow
        
        addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.width.equalTo(300)
        }
        
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(30)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

//// MARK: - Constants
//private extension CGFloat {
//    static let mainImageWidth = UIScreen.main.bounds.width - 24
//    static let mainImageHeight = 231
//    
//    static let dateImageWidth = 14
//    static let dateImageHeight = 13
//}
