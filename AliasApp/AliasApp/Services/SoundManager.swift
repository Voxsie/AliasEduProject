//
//  SoundManager.swift
//  AliasApp
//
//  Created by NaYfront on 24.05.2023.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init() {
        prepare()
    }
    
    func playSound(sound: Sound) {
        if let player = SoundManager.shared.player, player.isPlaying {
            player.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: sound.rawValue, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let souldURL = soundURL else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(filePath: souldURL))
            
            guard let player = player else {
                return
            }
            
            player.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func prepare() {
        let soundURL = Bundle.main.path(forResource: "buttonTapping", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let souldURL = soundURL else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(filePath: souldURL))
            
            guard let player = player else {
                return
            }
            
            player.prepareToPlay()
        } catch {
            print("something went wrong")
        }
    }
    
    func pause() {
        if let player = SoundManager.shared.player, player.isPlaying {
            player.stop()
        }
    }
}
