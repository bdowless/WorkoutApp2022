//
//  ExerciseVideo.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 3/9/22.
//

import UIKit
import AVFoundation
import YouTubeiOSPlayerHelper

class ExerciseVideo: UIView {
    
    //MARK: - Properties
    
    var playerView: YTPlayerView?
    
    var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var exercise: Exercise? {
        didSet {
            playVideo()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        playVideo()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers

    
    func playVideo() {
//        guard let exercise = exercise else { return }
//        let excersiseVideoURL = exercise.video
        guard let url = URL(string: "https://bit.ly/swswift") else { return }
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)

        self.layer.addSublayer(playerLayer)
        playerLayer.frame = self.frame
        playerLayer.videoGravity = .resizeAspect
        player.play()
    }
}
