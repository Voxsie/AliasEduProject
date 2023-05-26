//
//  ParagraphView.swift
//  AliasApp
//
//  Created by NaYfront on 25.05.2023.
//

import UIKit

class ParagraphView: UIView {
    
    // MARK: - User Interface
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalBlack
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.font = .TTCommonsBlack(size: 16)
        
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .generalBlack
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.font = .TTCommons(type: .regular, size: 16)
        
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, textLabel])
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        sv.spacing = 5
        
        return sv
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, verticalStackView])
        sv.spacing = 10
        sv.axis = .horizontal
        sv.distribution = .fill
        
        return sv
    }()
    
    // MARK: - Initializers
    init(image: UIImage, title: String, text: String) {
        super.init(frame: .zero)
        
        self.imageView.image = image
        self.titleLabel.text = title
        self.textLabel.text = text
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func addSubviews() {
        addSubview(horizontalStackView)
        horizontalStackView.addSubview(imageView)
        horizontalStackView.addSubview(verticalStackView)
        verticalStackView.addSubview(titleLabel)
        verticalStackView.addSubview(textLabel)
    }
    
    private func setupUI() {
        addSubviews()
        
        self.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(48)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
    }
}
