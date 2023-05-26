//
//  RulesViewController.swift
//  AliasApp
//
//  Created by NaYfront on 24.05.2023.
//

import UIKit
import SnapKit

class RulesViewController: UIViewController {

    var viewModel: RulesViewModel!
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Правила"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .TTCommonsBlack(size: 16)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Alias"
        label.textColor = .generalBlack
        label.font = .monoton(size: 64)
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupView()
    }
    
    init(withViewModel viewModel: RulesViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        view.backgroundColor = .generalYellow
        navigationItem.titleView = titleView
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(-20)
        }
        
        let constraint = (UIScreen.main.bounds.width - 264) / 8
        
        let images = [#imageLiteral(resourceName: "target"), #imageLiteral(resourceName: "forbidden"), #imageLiteral(resourceName: "favourite-star"), #imageLiteral(resourceName: "award")]
        let titles = ["Цель", "Запрещено", "Очки", "Победа"]
        let strings =
        ["Каждый игрок должен объяснить как можно больше слов своим товарищам по команде за ограниченное время.",
         "При объяснении слов нельзя упоминать какую-либо часть слова, а также переводить с других языков.",
         "За отгаданное слово команда получает одно очко, но за пропущенное слово команда теряет одно очко",
         "Чтобы победить в игре, команда должна набрать заранее определенное количество очков."
        ]
        
        for i in 0..<4 {
            let paragraphView = ParagraphView(image: images[i],
                                              title: titles[i],
                                              text: strings[i])
            
            view.addSubview(paragraphView)
            paragraphView.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(constraint)
                make.top.equalTo(titleLabel.snp.bottom).offset(100*i+20)
            }
        }
        
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
