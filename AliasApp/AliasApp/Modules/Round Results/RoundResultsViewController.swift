//
//  RoundCountedWordsViewController.swift
//  AliasApp
//
//  Created by Арслан Рашидов on 25.05.2023.
//

import UIKit

class RoundResultsViewController: UIViewController {
    
    var viewModel: RoundResultsViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Результаты игры"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()
    
    private lazy var winnerTitleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Победитель - "
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 20)
        label.backgroundColor = .generalYellow
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(TitleWithImageTableViewCell.self, forCellReuseIdentifier: TitleWithImageTableViewCell.reuseID)
        return tv
    }()
    
    private lazy var continueButton = PrimaryButton(with: "Сыграть еще раз", type: .purple, image: "", animated: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SoundManager.shared.playSound(sound: .victory)
    }
    
    init(withViewModel viewModel: RoundResultsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        
        view.backgroundColor = .generalYellow
        
        navigationItem.titleView = titleView
        
        winnerTitleView.text! += viewModel.winner.name
        
        view.addSubview(winnerTitleView)
        winnerTitleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(25)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .generalYellow

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(winnerTitleView.snp.bottom)
            //make.width.equalTo(winnerTitleView.snp.width)
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
        navigationItem.backBarButtonItem = UIBarButtonItem()
    }
}

extension RoundResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithImageTableViewCell.reuseID, for: indexPath) as? TitleWithImageTableViewCell
        else { fatalError() }
        cell.configure(image: nil,
                       title: viewModel.teams[indexPath.row].name,
                       subtitle: "\(viewModel.teams[indexPath.row].score)",
                       letterKit: true)
        cell.selectionStyle = .none
        return cell
    }
}
