//
//  TitleWithImageTableViewCell.swift
//  AliasApp
//
//  Created by Илья Желтиков on 17.05.2023.
//

import UIKit
import LetterAvatarKit

class TitleWithImageTableViewCell: UITableViewCell {
    
    static var reuseID = String(describing: TitleWithImageTableViewCell.self)
    
    fileprivate lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .TTCommons(type: .regular, size: 16)
        return label
    }()
    
    fileprivate lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .TTCommons(type: .demiBold, size: 16)
        label.textAlignment = .right
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
            make.top.equalTo(12)
            make.left.equalTo(self.snp.left).offset(16)
            make.height.equalTo(44)
            make.width.equalTo(44)
            make.bottom.equalTo(-12)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.left.equalTo(mainImageView.snp.right).offset(12)
            make.right.equalToSuperview().offset(-100)
            make.centerY.equalTo(mainImageView.snp.centerY)
        }
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.equalTo(84)
        }
        
    }
    
    func configure(image: UIImage?, title: String, subtitle: String? = nil, letterKit: Bool = false) {
        
        if letterKit {
            let config = LetterAvatarBuilderConfiguration()
            config.username = title
            config.useSingleLetter = true
            config.circle = true
            config.lettersFont = .inter(type: .semibold, size: 32)
            config.lettersColor = .white
            mainImageView.image = UIImage.makeLetterAvatar(withConfiguration: config)
        } else {
            mainImageView.image = image
        }
        
        titleLabel.text = title
        
        if subtitle != nil {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        } else {
            subtitleLabel.isHidden = false
        }
    }
}
