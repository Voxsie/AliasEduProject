//
//  ImageWithTitleTableViewCell.swift
//  AliasApp
//
//  Created by Илья Желтиков on 18.05.2023.
//

import Foundation
import UIKit

class ImageWithTitleTableViewCell: UITableViewCell {
    
    static var reuseID = String(describing: ImageWithTitleTableViewCell.self)
    
    fileprivate lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .TTCommons(type: .demiBold, size: 17)
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            make.height.equalTo(150)
        }
        
        mainImageView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalTo(mainImageView.snp.leading).offset(16)
            make.right.lessThanOrEqualToSuperview().offset(-8)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(-16)
        }
    }
    
    func configure(image: UIImage?, title: String) {
        
        mainImageView.image = image
        titleLabel.text = title
    }
}
