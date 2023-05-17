//
//  PrimaryButton.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import Foundation
import UIKit
import SnapKit

enum PrimaryButtonType {
    case purple
    case white
}

class PrimaryButton: UIButton {
    
    //MARK: - UI Elements
    
    var bindTap: (() -> ())?
    var type: PrimaryButtonType
    
    fileprivate lazy var buttonView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 10
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private let imageButton: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let labelButton: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = false
        label.adjustsFontSizeToFitWidth = false
        label.font = .TTCommons(type: .demiBold, size: 17)
        return label
    }()
    
    fileprivate lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [labelButton])
        stack.spacing = 8
        stack.isUserInteractionEnabled = false
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let loader = LoaderView()
    
    private var animated: Bool = true
    
    //MARK: - Initializer
    
    init(with text: String, type: PrimaryButtonType, image: String = "", animated: Bool = true) {
        self.type = type
        super.init(frame: .zero)
        self.animated = animated
        configureType(type: type)
        configure(with: text)
        addTarget(self, action: #selector(didtapOnButton), for: .touchUpInside)
        if image != "" { setImage(UIImage.init(named: image), for: .normal) }
        if text == "" { labelButton.isHidden = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoading() {
        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        isUserInteractionEnabled = false
        buttonView.addSubview(loader)
        loader.show()
        loader.isHidden = true
        loader.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(6)
        }
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.buttonView.snp.remakeConstraints { make in
                make.centerY.centerX.equalToSuperview()
                make.width.height.equalTo(46)
            }
            self.layoutIfNeeded()
            self.buttonView.layer.cornerRadius = 23
            self.stackView.isHidden = true
        }) { _ in
            self.loader.isHidden = false
        }
    }
    
    func stopLoading() {
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.loader.isHidden = true
        }) { _ in
            UIView.animate(withDuration: 0.4, delay: 0, animations:  {
                self.buttonView.snp.makeConstraints { make in make.edges.equalToSuperview() }
                self.layoutIfNeeded()
                self.buttonView.layer.cornerRadius = 10
                self.stackView.isHidden = false
            }) { _ in
                self.loader.removeFromSuperview()
                self.isUserInteractionEnabled = true
            }
        }
    }
    
    func removeShadow() {
        buttonView.layer.shadowOpacity = 0
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        labelButton.text = title
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        if imageButton.image == nil { stackView.insertArrangedSubview(imageButton, at: 0) }
        imageButton.image = image
    }
    
    func setImageToRightPosition(_ image: UIImage?, for state: UIControl.State) {
        if imageButton.image == nil { stackView.insertArrangedSubview(imageButton, at: 1) }
        imageButton.image = image
    }
    
    private func configure(with text: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.centerY.centerX.width.height.equalToSuperview()
        }
        buttonView.layer.cornerRadius = 10
        
        
        addSubview(stackView)
        labelButton.text = text
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.top).offset(13)
            make.left.greaterThanOrEqualTo(self.snp.left).offset(8)
            make.right.greaterThanOrEqualTo(self.snp.left).offset(-8)
            make.bottom.equalTo(self.snp.bottom).offset(-13)
        }
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(buttonView.snp.width)
        }
    }
    
    func configureType(type: PrimaryButtonType) {
        switch type {
        case .white:
            buttonView.backgroundColor = .white
            labelButton.textColor = .generalBlack
            buttonView.layer.borderWidth = 1
            loader.switchImage(image: "loader")
        case .purple:
            buttonView.backgroundColor = .generalPurple
            labelButton.textColor = .white
            loader.switchImage(image: "loaderView")
        }
    }
    
    func changeTypeAndTitle(type: PrimaryButtonType, new title: String) {
        self.type = type
        configureType(type: type)
        setTitle(title, for: .normal)
    }
    
    override var isEnabled: Bool {
        didSet {
            let duration: Double = animated ? 0.3 : 0
            if isEnabled {
                UIView.animate(withDuration: duration) {
                    self.configureType(type: self.type)
                }
            } else {
                buttonView.layer.borderColor = UIColor.clear.cgColor
                buttonView.layer.borderWidth = 0
                UIView.animate(withDuration: duration) {
                    self.buttonView.backgroundColor = .darkGray
                    self.labelButton.textColor = .generalBlack
                    self.loader.switchImage(image: "loaderView")
                }
            }
        }
    }
    
    @objc
    private func didtapOnButton() {
        bindTap?()
    }
}

