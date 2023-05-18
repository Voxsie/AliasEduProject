//
//  GameSettingsViewController.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import UIKit

class GameSettingsViewController: UIViewController {
    
    var viewModel: GameSettingsViewModel!
    
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
        tv.register(TitleWithImageTableViewCell.self, forCellReuseIdentifier: TitleWithImageTableViewCell.reuseID)
        return tv
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Далее", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: GameSettingsViewModel) {
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
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        continueButton.addTarget(self, action: #selector(goNextStep), for: .touchUpInside)
        
    }
    
    @objc
    private func goNextStep() {
        
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension GameSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithImageTableViewCell.reuseID, for: indexPath) as? TitleWithImageTableViewCell
        else { fatalError() }
        cell.configure(image: nil, title: "\(indexPath.row)", letterKit: false)
        cell.selectionStyle = .none
        return cell
    }
}
