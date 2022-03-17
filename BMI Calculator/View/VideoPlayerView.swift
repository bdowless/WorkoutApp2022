//
//  VideoPlayerView.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 3/10/22.
//

import Foundation
import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playVideo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func playVideo() {
        guard let url = URL(string: "https://bit.ly/swswift") else { return }
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspect
        player.play()
        
        self.layer.addSublayer(playerLayer)
    }
}
