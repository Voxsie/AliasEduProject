//
//  SwapCardsViewController.swift
//  AliasApp
//
//  Created by Tagir Kabirov on 22.05.2023.
//

import Foundation
import Shuffle_iOS

class SwapCardsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var viewModel: SwapCardsViewModel
    private var timer: Timer = Timer()
    private var count: Int
    private var timerCounting: Bool = false
    
    // MARK: - UI Elements
    
    private lazy var timerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    fileprivate let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        return button
    }()
    
    private let cardStack = SwipeCardStack()
    
    // MARK: - Life Cycle
    
    init(withViewModel viewModel: SwapCardsViewModel) {
        self.viewModel = viewModel
        self.count = viewModel.roundSeconds
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNewGame()
        teamNameLabel.text = viewModel.teamName
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.currentTeam = -1
        setupTimerView()
        setupNavigationController()
        setupConstraints()
        view.backgroundColor = UIColor(red: 255/255, green: 216/255, blue: 69/255, alpha: 1)
        view.addSubview(cardStack)
        cardStack.snp.makeConstraints { make in
            make.top.equalTo(timerView.snp.bottom).inset(-52)
            make.leading.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(150)
        }
        cardStack.dataSource = self
        cardStack.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    // MARK: - Setup Functions
    
    private func setupConstraints() {
        view.addSubview(teamNameLabel)
        teamNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
        }
    }
    
    private func setupNewGame() {
        setupTimerLogic()
        viewModel.changeTeam()
        let gameTime = secondsToHoursMinutesSeconds(seconds: count)
        self.timeLabel.text = self.makeTimeString(minutes: gameTime.0, seconds: gameTime.1)
        timeLabel.textColor = .black
    }
    
    private func setupTimerView() {
        let gameTime = secondsToHoursMinutesSeconds(seconds: count)
        self.timeLabel.text = self.makeTimeString(minutes: gameTime.0, seconds: gameTime.1)
        
        view.addSubview(timerView)
        timerView.layer.cornerRadius = 15
        timerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        timerView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(11)
        }
    }
    
    private func setupNavigationController() {
        closeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)
    }
    
    @objc
    private func dismissViewController() {
        let alert = UIAlertController(title: "Выход из игры", message: "Вы уверены, что хотите покинуть игру?", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Покинуть", style: .cancel) { [weak self] _ in
            self?.timer.invalidate()
            self?.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(dismissAction)
        let continueAction = UIAlertAction(title: "Продолжить", style: .default, handler: nil)
        alert.addAction(continueAction)
        self.present(alert, animated: true)
    }
    
    private func setupTimerLogic() {
        self.count = viewModel.roundSeconds
        timerCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() -> Void {
        if count == 15 {
            timeLabel.textColor = .red
        }
        if count == 0 {
            timer.invalidate()
            SoundManager.shared.pause()
            SoundManager.shared.playSound(sound: .roundEnd)
            let vm = RoundCountedWordsViewModel(teams: viewModel.teams,
                                                words: viewModel.guessedWords,
                                                currentTeamIndex: viewModel.currentTeam,
                                                maxScore: viewModel.maxScore)
            let vc = RoundCountedWordsViewController(withViewModel: vm)
            let navigation = UINavigationController(rootViewController: vc)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: false)
        } else {
            count = count - 1
            let time = secondsToHoursMinutesSeconds(seconds: count)
            let timeString = makeTimeString(minutes: time.0, seconds: time.1)
            timeLabel.text = timeString
        }
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int) {
        return (((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
        
    func makeTimeString( minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
                                     
                                     
    
    @objc
    private func timerFired() {
        
    }
    
    func card() -> SwipeCard {
        let card = SwipeCard()
        card.swipeDirections = [.left, .right]
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = viewModel.getRandomWord()
        label.textAlignment = .center
        card.backgroundColor = .white.withAlphaComponent(80)
        card.layer.cornerRadius = 30
        card.content = label
      
        let leftOverlay = UIView()
        leftOverlay.backgroundColor = .red
        leftOverlay.layer.cornerRadius = 30
        
      
        let rightOverlay = UIView()
        rightOverlay.backgroundColor = .green
        rightOverlay.layer.cornerRadius = 30
      
        card.setOverlays([.left: leftOverlay, .right: rightOverlay])
        
        return card
    }
}

// MARK: - SwipeCardStackDataSource

extension SwapCardsViewController: SwipeCardStackDataSource {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card()
    }

    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
      return 10
    }
}

// MARK: -

extension SwapCardsViewController: SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        if direction == .right { SoundManager.shared.playSound(sound: .guessedWord) }
        else { SoundManager.shared.playSound(sound: .skipWord)}
        viewModel.setWordTo(state: direction == .right)
        if index == 7 {
            cardStack.reloadData()
        }
    }
}
