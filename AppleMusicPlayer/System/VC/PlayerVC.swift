//
//  PlayerVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {
    // MARK: - IBOutlets -
    @IBOutlet weak var lblSongName: UILabel!
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var imgSongImage: UIImageView!
    @IBOutlet weak var VolumeControl: UISlider!
    @IBOutlet weak var SongProgressSlider: UISlider!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    
    
    // MARK: - Variables -
    public var position: Int = 0
    public var songs: [Song] = []
    var player: AVAudioPlayer?
    var progressTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.configure()
        self.imgSongImage.layer.cornerRadius = imgSongImage.frame.height / 2
    }
    // MARK: - IBActions -
    
    @IBAction func btnDissmis(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
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
        if self.position < (self.songs.count - 1) {
            self.position = self.position + 1
            self.loadSong()
        } else {
            print("No more songs.")
        }
    }
    // MARK: - @objc functions -
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    @objc func updateSlider() {
        guard let player = player else { return }

        SongProgressSlider.maximumValue = Float(player.duration)
        SongProgressSlider.value = Float(player.currentTime)
        
        lblCurrentTime.text = formatTime(player.currentTime)
        lblDuration.text = formatTime(player.duration)
    }
    
    @objc func didSlideProgress(_ slider: UISlider) {
        player?.currentTime = TimeInterval(slider.value)
    }

    // MARK: - override func -
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
            progressTimer?.invalidate()

        }
    }
    //MARK: - Functions -
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
            try AVAudioSession.sharedInstance().setActive(true)
            
            let url = URL(fileURLWithPath: urlString)
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.5
            player?.play()
            progressTimer?.invalidate()
            progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
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
        self,action: #selector(didSlideSlider(_:)),for: .valueChanged)
        SongProgressSlider.maximumValue = Float(player?.duration ?? 1.0)
        SongProgressSlider.value = 0.0
        SongProgressSlider.addTarget(self, action: #selector(didSlideProgress(_:)), for: .valueChanged)
        lblCurrentTime.text = "0:00"
        lblDuration.text = formatTime(player?.duration ?? 0.0)
    }
    
    func loadSong() {
        // Stop previous
        player?.stop()
        progressTimer?.invalidate()
        
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
            player?.play()

            // Timer for slider sync
            progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)

        } catch {
            print("Error loading player.")
            return
        }

        // Update UI
        lblSongName.text = song.name
        lblAlbumName.text = song.albumName
        lblArtistName.text = song.artistName
        imgSongImage.image = UIImage(named: song.imageName)
        SongProgressSlider.maximumValue = Float(player?.duration ?? 1.0)
        SongProgressSlider.value = 0.0
        lblCurrentTime.text = "0:00"
        lblDuration.text = formatTime(player?.duration ?? 0.0)
    }
    func formatTime(_ time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%d:%02d", minutes, seconds)
        }
    
}
