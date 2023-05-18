//
//  LoaderView.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import UIKit

class LoaderView: UIView {
    
    private let loaderImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loader")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        addSubview(loaderImageView)
        loaderImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        isHidden = false
        self.rotate(imageView: loaderImageView, aCircleTime: 1)
    }
    
    func switchImage(image: String) {
        loaderImageView.image = UIImage(named: image)
    }
    
    func hide() {
        isHidden = true
        loaderImageView.layer.removeAnimation(forKey: "rotate")
    }
    
    func rotate(imageView: UIImageView, aCircleTime: Double) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: "rotate")
    }
}
