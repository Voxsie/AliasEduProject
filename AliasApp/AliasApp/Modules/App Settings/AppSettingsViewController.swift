//
//  AppSettingsViewController.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import UIKit

class AppSettingsViewController: UIViewController {
    
    var viewModel: AppSettingsViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Настройки игры"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TitleWithSwitchTableViewCell.self, forCellReuseIdentifier: TitleWithSwitchTableViewCell.reuseID)
        tv.register(TitleWithSegmentControlTableViewCell.self, forCellReuseIdentifier: TitleWithSegmentControlTableViewCell.reuseID)
        
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Сохранить", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: AppSettingsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        
        view.backgroundColor = .generalYellow
        
        navigationItem.titleView = titleView

        tableView.backgroundColor = .generalYellow
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        continueButton.addTarget(self, action: #selector(saveSettings), for: .touchUpInside)
        
    }
    
    @objc
    private func saveSettings() {
        viewModel.saveData()
        showOkAlert()
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func showOkAlert() {
        let alert = UIAlertController(title: "Настройки", message: "Настройки успешно изменены!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Готово", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

extension AppSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithSegmentControlTableViewCell.reuseID) as? TitleWithSegmentControlTableViewCell
            else { return UITableViewCell() }
            cell.configure(indexPathRow: indexPath.row, title: "Язык", states: ["Русский", "Английский"], selectedLanguage: viewModel.language)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithSwitchTableViewCell.reuseID, for: indexPath) as? TitleWithSwitchTableViewCell
            else { return UITableViewCell() }
            cell.index = indexPath.row
            cell.configure(indexPathRow: indexPath.row, title: "Звук", switchState: viewModel.isEnabledSound)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            return cell
        }
    }
}

extension AppSettingsViewController: SegmentControlDelegate {
    func didValueChanged(with index: Int, value: Int) {
        viewModel.language = value == 0 ? .russian : .english
    }
}

extension AppSettingsViewController: SwitcherDelegate {
    func didValueChanged(with index: Int, value: Bool) {
        viewModel.isEnabledSound = value
        print(viewModel.isEnabledSound)
    }
}
