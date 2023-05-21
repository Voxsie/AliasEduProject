//  TitleWithSwitchTableViewCell.swift
//  AliasApp
//
//  Created by Илья Желтиков on 20.05.2023.
//

import Foundation
import UIKit

//protocol SwitcherDelegate: AnyObject {
//    func didValueChanged(with index: Int, value: Bool)
//}

class TitleWithSegmentControlTableViewCell: UITableViewCell {
    
    static var reuseID = String(describing: TitleWithSwitchTableViewCell.self)
    
    weak var delegate: SwitcherDelegate?
    
    var index: Int = 0
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .TTCommons(type: .regular, size: 16)
        return label
    }()
    
    fileprivate lazy var segmentControl: UISegmentedControl = {
        let switcher = UISegmentedControl(items: ["", ""])
        return switcher
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(24)
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalToSuperview().offset(-100)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        
        contentView.addSubview(segmentControl)
        segmentControl.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        segmentControl.addTarget(self, action: #selector(switcherValueChanged), for: .valueChanged)
    }
    
    @objc
    private func switcherValueChanged() {
        //
    }
    
    func configure(indexPathRow: Int, title: String, states: [String]) {
        index = indexPathRow
        titleLabel.text = title
        segmentControl
        states.enumerated().forEach { index, item in
            segmentControl.setTitle(item, forSegmentAt: index)
        }
    }
}

