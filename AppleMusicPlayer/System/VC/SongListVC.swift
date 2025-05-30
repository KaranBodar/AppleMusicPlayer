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
    var song : [Song] = []
    var filteredArray: [Song] = []
    var selectedArtistsname: String?
    
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
    
    
    @IBAction func clickBack(_ sender: UIButton) {

        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func clickSettings(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ProfileSettings", bundle: nil).instantiateViewController(identifier: "SettingsVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - TableView -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XIBCell1") as! XIBCell1
        let song = filteredArray[indexPath.row]
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
        vc.songs = filteredArray
        vc.position = indexPath.row
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    // MARK: - Functions -
    func configureSong() {
        self.song = [
        // MARK: - Yoyo HoneySingh -
        Song(name: "Millioner", albumName: "Glory", artistName: "Yoyo HoneySingh", imageName: "HoneySingh2", trackName: "Millioner"),
        Song(name: "Payal", albumName: "Glory", artistName: "Yoyo HoneySingh", imageName: "HoneySingh2", trackName: "Payal"),
        Song(name: "Maniac", albumName: "None", artistName: "Yoyo HoneySingh", imageName: "HoneySingh2", trackName: "MANIAC"),
        Song(name: "Habibti", albumName: "Glory", artistName: "Yoyo HoneySingh", imageName: "HoneySingh2", trackName: "Habibti"),
        Song(name: "Shopping List ", albumName: "Glory", artistName: "Yoyo HoneySingh", imageName: "HoneySingh2", trackName: "Shopping List "),
        
        // MARK: - Kendrick Lamar -

        Song(name: "TV Off", albumName: "None", artistName: "Kendrick Lamar", imageName: "KendrickLamar2", trackName: "TV Off"),
        Song(name: "Not Like Us", albumName: "None", artistName: "Kendrick Lamar", imageName: "KendrickLamar2", trackName: "Not Like Us"),
        
        // MARK: - Emiway Batai -
        Song(name: "GoodBoy", albumName: "None", artistName: "Emiway Bantai", imageName: "Emiway", trackName: "GoodBoy"),
        Song(name: "BADSHAH", albumName: "None", artistName: "Emiway Bantai", imageName: "Emiway", trackName: "BADSHAH"),
        
        // MARK: - Hanumankind -
        Song(name: "BigDawgs", albumName: "None", artistName: "Hanumankind", imageName: "Hnumankind", trackName: "BigDawgs"),
        Song(name: "Run It Up", albumName: "None", artistName: "Hanumankind", imageName: "Hnumankind", trackName: "Run It Up"),
        
        // MARK: - Aditya Gadhavi -
        Song(name: "Naagar Nandji Na Laal", albumName: "None", artistName: "Aditya Gadhavi", imageName: "Aditya gadhavi2", trackName: "Naagar Nandji Na Laal"),
        Song(name: "Kaljug No Kanaiyo", albumName: "None", artistName: "Aditya Gadhavi", imageName: "Aditya gadhavi2", trackName: "Kaljug No Kanaiyo"),
        Song(name: "Rang Bhini Radha", albumName: "None", artistName: "Aditya Gadhavi", imageName: "Aditya gadhavi2", trackName: "Rang Bhini Radha"),
        
        // MARK: - Kailash Kher -
        Song(name: "Teri Deewani", albumName: "None", artistName: "Kailash Kher", imageName: "Kailash Kher2", trackName: "Teri Deewani"),
        Song(name: "Saiyyan", albumName: "None", artistName: "Kailash Kher", imageName: "Kailash Kher2", trackName: "Saiyyan"),
        Song(name: "Piya Ghar Aavenge", albumName: "None", artistName: "Kailash Kher", imageName: "Kailash Kher2", trackName: "Piya Ghar Aavenge"),

        
        // MARK: - Mix -
        Song(name: "Bye Bye Bye DEADPOOL & WOLVERINE", albumName: "None", artistName: "Mix Album", imageName: "DeadPool", trackName: "Bye Bye Bye DEADPOOL & WOLVERINE"),
        Song(name: "Illuminati", albumName: "None", artistName: "Mix Album", imageName: "Illuminati", trackName: "Illuminati"),
        Song(name: "DesiHood", albumName: "None", artistName: "Mix Album", imageName: "DesiHood", trackName: "DesiHood"),
        Song(name: "Tony's Myhem", albumName: "None", artistName: "Mix Album", imageName: "Tony's Myhem", trackName: "Tony's Myhem"),
        ]
        if let selectedArtist = selectedArtistsname {
            filteredArray = song.filter { $0.artistName.lowercased() == selectedArtist.lowercased() }
        } else {
            filteredArray = song
        }

    }
}
