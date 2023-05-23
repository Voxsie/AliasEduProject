//
//  SelectWordPackViewController.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import Foundation
import UIKit

class SelectWordPackViewController: UIViewController {
    
    var viewModel: SelectWordPackViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Наборы слов"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(ImageWithTitleTableViewCell.self, forCellReuseIdentifier: ImageWithTitleTableViewCell.reuseID)
        return tv
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Далее", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: SelectWordPackViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        
        view.backgroundColor = .generalYellow
        
        navigationItem.titleView = titleView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .generalYellow
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension SelectWordPackViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        WordPackManager.shared.getListOfPacks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageWithTitleTableViewCell.reuseID, for: indexPath) as? ImageWithTitleTableViewCell
        else { fatalError() }
        let wordPack = WordPackManager.shared.getListOfPacks()[indexPath.section]
        cell.configure(
            image: wordPack.logo,
            title: " \(wordPack.title) ",
            isUnlocked: wordPack.isUnlocked)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wordPack = WordPackManager.shared.getListOfPacks()[indexPath.section]
        if wordPack.isUnlocked {
            let vm = GameSettingsViewModel(teams: viewModel.teams, wordPack: wordPack)
            let gameSettingsVC = GameSettingsViewController(withViewModel: vm)
            self.navigationController?.pushViewController(gameSettingsVC, animated: true)
        } else {
            let buyAction = UIAlertAction(title: "Купить", style: .default)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
            let alert = UIAlertController(title: "Покупка набора '\(wordPack.title)'", message: "Вы действительно хотите перейти к покупке набора?", preferredStyle: .alert)
            alert.addAction(buyAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
    }
}
