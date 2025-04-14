//
//  PlayerVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import AVFoundation
import UIKit

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
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configure()
//        let blurEffect = UIBlurEffect(style: .light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = self.holder.bounds
//        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.holder.layer.cornerRadius = 25
//        self.holder.clipsToBounds = true
//        blurView.layer.cornerRadius = 25
//        blurView.clipsToBounds = true
//        self.holder.insertSubview(blurView, at: 0)
//        self.holder.backgroundColor = UIColor.clear
    }
    // MARK: - IBActions -

    @IBAction func btnPreviousSong(_ sender: UIButton) {
        if self.position > 0 {
            self.position = self.position - 1
            self.loadSong()
        } else {
            print("This is first song.")
        }
    }
    @IBAction func btnPlayPause(_ sender: UIButton) {
        if let player = player {
            if player.isPlaying {
                player.pause()
                sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
                print("Paused")
            } else {
                player.play()
                sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                print("Playing")
            }
        } else {
            print("Player is nil — this shouldn't happen")
        }
    }
    @IBAction func btnNextSong(_ sender: UIButton) {
        if self.position < (self.songs.count - 1){
            self.position = self.position + 1
            self.loadSong()
        } else {
            print("No more songs.")
        }
    }
    func configure() {
        //SetUp Player
        let song = songs[position]
        guard
            let urlString = Bundle.main.path(
                forResource: song.trackName,
                ofType: "mp3"
            )
        else {
            print("Audio file not found: \(song.trackName).mp3")
            return
        }
        print("Found audio file at: \(urlString)")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(
                true /*, options: .notifyOthersOnDeactivation*/
            )

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
        self.VolumeControl.addTarget(
            self,
            action: #selector(didSlideSlider(_:)),
            for: .valueChanged
        )

        //Configure UserInteraction Buttons
        //        self.btnPlayPause.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        //        self.btnNextSong.addTarget(self, action: #selector(didTapNextSong), for: .touchUpInside)
        //        self.btnPreviousSong.addTarget(self, action: #selector(didTapPreviousSong), for: .touchUpInside)
    }
    // MARK: - @objc functions -
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    //    @objc func didTapNextSong() {
    //
    //    }
    //    @objc func didTapPreviousSong() {
    //
    //    }
    //    @objc func didTapPlayPause() {
    //
    //    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
//MARK: - Functions -
    func loadSong() {
        // Stop current player if playing
        player?.stop()
        
        let song = songs[position]
        guard let path = Bundle.main.path(forResource: song.trackName, ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        do {
            let url = URL(fileURLWithPath: path)
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = VolumeControl.value
            player?.prepareToPlay()
        } catch {
            print("Error loading player.")
            return
        }
        // Update UI elements
        lblSongName.text = song.name
        lblAlbumName.text = song.albumName
        lblArtistName.text = song.artistName
        imgSongImage.image = UIImage(named: song.imageName)
        
        // Starts to play new song automaticaly
        self.player?.play()
        
    }

}
