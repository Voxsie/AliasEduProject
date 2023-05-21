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
    
    func configure(image: UIImage?, title: String, isUnlocked: Bool) {
        
        mainImageView.image = image
        titleLabel.text = title
        
        if !isUnlocked {
            configureLocked()
        }
    }
    
    func configureLocked() {
        let image = mainImageView.image
        mainImageView.image = convertToGrayScale(image: image ?? UIImage())
        
        titleLabel.snp.remakeConstraints { make in
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
        let txt = titleLabel.text ?? ""
        let title = txt.replacingOccurrences(of: " ", with: "")
        let textToBuy = " Купить набор '\(title)' "
        titleLabel.text = textToBuy
    }
    
    func convertToGrayScale(image: UIImage) -> UIImage {

        // Create image rectangle with current image width/height
        let imageRect:CGRect = CGRect(x:0, y:0, width:image.size.width, height: image.size.height)

        // Grayscale color space
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height

        // Create bitmap content with current image size and grayscale colorspace
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)

        // Draw image into current context, with specified rectangle
        // using previously defined context (with grayscale colorspace)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(image.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()

        // Create a new UIImage object
        let newImage = UIImage(cgImage: imageRef!)

        return newImage
    }
}
