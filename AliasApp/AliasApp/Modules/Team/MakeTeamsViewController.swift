//
//  MakeTeamsViewController.swift
//  AliasApp
//
//  Created by Илья Желтиков on 17.05.2023.
//

import UIKit

class MakeTeamsViewController: UIViewController {
    
    var viewModel: MakeTeamViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Команды"
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
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        return button
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Далее", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: MakeTeamViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        
        view.backgroundColor = .generalYellow
        
        navigationItem.titleView = titleView
        addButton.addTarget(self, action: #selector(addTeam), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
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
    private func addTeam() {
        viewModel.addTeam {
            tableView.reloadData()
        }
    }
    
    @objc
    private func goNextStep() {
        let vm = SelectWordPackViewModel(teams: viewModel.teams)
        let wordPackVC = SelectWordPackViewController(withViewModel: vm)
        self.navigationController?.pushViewController(wordPackVC, animated: true)
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension MakeTeamsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithImageTableViewCell.reuseID, for: indexPath) as? TitleWithImageTableViewCell
        else { fatalError() }
        cell.configure(image: nil, title: viewModel.teams[indexPath.row].name, letterKit: true)
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "", handler: {a,b,c in
            self.viewModel.deleteTeam(at: indexPath.row) {
                tableView.reloadData()
            }
        })
        
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(named: "deleteIcon")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        let label = UILabel()
        label.text = "   Максимальное количество команд -- 8"
        label.textColor = .generalBlack
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.font = .TTCommonsBlack(size: 12)
        
        footerView.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(footerView.snp.top).inset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
        }

        return footerView
    }
}
