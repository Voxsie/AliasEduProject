//
//  TitleWithStepperTableViewCell.swift
//  AliasApp
//
//  Created by Илья Желтиков on 20.05.2023.
//

import UIKit

class TitleWithStepperTableViewCell: UITableViewCell {

    static var reuseID = String(describing: TitleWithStepperTableViewCell.self)
    
    weak var delegate: SwitcherDelegate?

    var index: Int = 0
    
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
        return label
    }()
    
    fileprivate lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        return stepper
        
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
        
        contentView.addSubview(stepper)
        stepper.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        stepper.addTarget(self, action: #selector(switcherValueChanged), for: .valueChanged)
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.right.equalTo(stepper.snp.left).offset(-16)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
    }
    
    @objc
    private func switcherValueChanged() {
        subtitleLabel.text = "\(stepper.value)"
//        delegate?.didValueChanged(with: index, value: mainSwitch.isOn)
    }
    
    func configure(indexPathRow: Int, title: String, minValue: Double, maxValue: Double, currentValue: Double) {
        index = indexPathRow
        titleLabel.text = title
        
        stepper.minimumValue = minValue
        stepper.value = currentValue
        stepper.maximumValue = maxValue
        stepper.stepValue = 1
        subtitleLabel.text = "\(stepper.value)"
    }
}


