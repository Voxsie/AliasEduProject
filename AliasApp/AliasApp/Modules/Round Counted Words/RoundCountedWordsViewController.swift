//
//  RoundCountedWordsViewController.swift
//  AliasApp
//
//  Created by Арслан Рашидов on 25.05.2023.
//

import UIKit

class RoundCountedWordsViewController: UIViewController {
    
    var viewModel: RoundCountedWordsViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Удалить слова"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TitleWithSwitchTableViewCell.self, forCellReuseIdentifier: TitleWithSwitchTableViewCell.reuseID)
        return tv
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Продолжить", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: RoundCountedWordsViewModel) {
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
        if viewModel.addPoints() {
            let vm = RoundResultsViewModel(teams: viewModel.teams)
            let vc = RoundResultsViewController(withViewModel: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vm = TeamListViewModel(teams: viewModel.teams)
            let vc = TeamListVewController(withViewModel: vm)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
}

extension RoundCountedWordsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithSwitchTableViewCell.reuseID, for: indexPath) as? TitleWithSwitchTableViewCell
        else { fatalError() }
        cell.index = indexPath.row
        let word = viewModel.words[indexPath.row]
        cell.configure(indexPathRow: indexPath.row, title: word.0, switchState: word.1)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
        

    }
}

extension RoundCountedWordsViewController: SwitcherDelegate {

    func didValueChanged(with index: Int, value: Bool) {
        viewModel.words[index].state = value
    }
    
}
