//
//  MainMenuViewController.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import UIKit
import SnapKit

class MainMenuViewController: UIViewController {
    
    var viewModel: MainScreenViewModel!
    
    fileprivate lazy var bottomMenuBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        return view
    }()
    
    fileprivate lazy var mainPhotoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "mainPhoto")
        return iv
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Alias"
        label.textColor = .generalBlack
        label.font = .monoton(size: 64)
        return label
    }()
    
    fileprivate lazy var copyrightLabel: UILabel = {
       let label = UILabel()
        label.text = "© 2023 Alias"
        label.textColor = .generalBlack
        label.font = .TTCommonsBlack(size: 12)
        return label
    }()
    
    fileprivate lazy var settingsButton = PrimaryButton(with: "", type: .purple, image: "settingsIcon", animated: false)
    
    fileprivate lazy var rulesButton = PrimaryButton(with: "Правила", type: .purple, image: "", animated: false)
    
    fileprivate lazy var startGameButton = PrimaryButton(with: "Новая игра", type: .purple, image: "", animated: false)
    
    fileprivate lazy var bottomButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [rulesButton, settingsButton])
        sv.spacing = 16
        sv.axis = .horizontal
        sv.distribution = .fill
        return sv
    }()
    
    fileprivate lazy var topButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [startGameButton, bottomButtonStackView])
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fill
        return sv
    }()
    
    init(withViewModel viewModel: MainScreenViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationController()
    }
    
    private func setupView() {
        view.backgroundColor = .generalYellow
        
        let menuHeight = view.safeAreaInsets.bottom + 250
        
        view.addSubview(bottomMenuBackgroundView)
        bottomMenuBackgroundView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(menuHeight)
        }
        
        view.addSubview(mainPhotoImageView)
        mainPhotoImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bottomMenuBackgroundView.snp.top).inset(-12)
            make.height.equalTo(mainPhotoImageView.snp.width)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(mainPhotoImageView.snp.top).inset(-50)
        }
        
        view.addSubview(copyrightLabel)
        copyrightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        bottomMenuBackgroundView.addSubview(topButtonStackView)
        topButtonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        startGameButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        rulesButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc
    func startGame() {
//        AppCoordinator.shared.showTeamScreen()
        self.navigationController?.pushViewController(MakeTeamsViewController(withViewModel: MakeTeamViewModel()), animated: true)
    }

}

