//
//  PlayerVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {
    //Outlets
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var lblSongName: UILabel!
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var imgSongImage: UIImageView!
    @IBOutlet weak var VolumeControl: UISlider!
    
    //Variables
    public var position: Int = 0
    public var songs: [Song] = []
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            if holder.subviews.count >= 0 {
                configure()
            }
    }
    func configure() {
    //SetUp Player
        let song = songs[position]
        guard let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3") else {
            print("Audio file not found: \(song.trackName).mp3")
            return
        }
        print("Found audio file at: \(urlString)")
        
        do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true/*, options: .notifyOthersOnDeactivation*/)
                
                let url = URL(fileURLWithPath: urlString)
                player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.5
                player?.play()
            } catch {
                print("Failed to initialize player: \(error.localizedDescription)")
            }
    //SetUp User InterFace Elements
        self.lblSongName.text = song.name
        self.lblAlbumName.text = song.albumName
        self.lblArtistName.text = song.artistName
        self.imgSongImage.image = UIImage(named: song.imageName)
        self.VolumeControl.value = 0.5
        self.VolumeControl.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}
