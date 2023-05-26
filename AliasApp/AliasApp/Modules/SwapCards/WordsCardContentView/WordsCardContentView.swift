//
//  WordsCardContentView.swift
//  AliasApp
//
//  Created by Tagir Kabirov on 23.05.2023.
//

import Foundation
import UIKit

class WordsCardContentView: UIView {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    init(withText text: String) {
        super.init(frame: .zero)
        textLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in make.edges.equalToSuperview() }
        
        backgroundView.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in make.center.equalToSuperview() }
    }
    
}
