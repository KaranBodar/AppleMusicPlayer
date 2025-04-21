//
//  SongListVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import UIKit
struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
class SongListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlets -
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var blureView: UIView!
    
    // MARK: - Variables -
    var song = [Song] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "XIBCell1", bundle: nil), forCellReuseIdentifier: "XIBCell1")
        self.blureView.layer.opacity = 0.6
        self.configureSong()
    }
    
    // MARK: - IBAction -
    
    
    @IBAction func clickProfile(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ProfileSettings", bundle: nil).instantiateViewController(identifier: "ProfileVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func clickSettings(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ProfileSettings", bundle: nil).instantiateViewController(identifier: "SettingsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - TableView -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XIBCell1") as! XIBCell1
        let song = song[indexPath.row]
        // Cell Properties
        cell.txtLabel?.text = song.name
        cell.txtDetailsLabel?.text = song.albumName
        cell.imgView?.image = UIImage(named: song.imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        // Present Player
        let position = indexPath.row
        // Songs
        guard let vc = storyboard?.instantiateViewController(identifier: "PlayerVC") as? PlayerVC
        else {
            return
        }
        vc.songs = song
        vc.position = position
        vc.modalPresentationStyle = .overCurrentContext
        //        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    // MARK: - Functions -
    func configureSong() {
        self.song.append(Song(name: "Millioner", albumName: "Glory", artistName: "Yoyo Honey Singh", imageName: "YoyoHoneySingh", trackName: "Millioner"))
        self.song.append(Song(name: "Payal", albumName: "Glory", artistName: "Peradox", imageName: "Paradox", trackName: "Payal"))
        self.song.append(Song(name: "GoodBoy", albumName: "Glory", artistName: "Emiway Batai", imageName: "Emiway", trackName: "GoodBoy"))
        self.song.append(Song(name: "BigDawgs", albumName: "None", artistName: "Hanumankind", imageName: "Hnumankind", trackName: "BigDawgs"))
        self.song.append(Song(name: "Maniac", albumName: "None", artistName: "Yoyo Honey Singh", imageName: "MANIAC", trackName: "MANIAC"))
        self.song.append(Song(name: "TV Off", albumName: "None", artistName: "Kendrick Lamar", imageName: "KendrickLamar", trackName: "TV Off"))
        self.song.append(Song(name: "Illuminati", albumName: "Aavesham", artistName: "Sushin Shyam", imageName: "Illuminati", trackName: "Illuminati"))
        self.song.append(Song(name: "Not Like Us", albumName: "None", artistName: "Kendrick Lamar", imageName: "KendrickLamar", trackName: "Not Like Us"))
    }
}
