//
//  HomeVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 22/04/25.
//

import UIKit

struct Artist {
    var name : String
    var image : String
}
class HomeVC: UIViewController{
    // MARK: - IBOutlets -
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables -
    var artistArr : [Artist] = [
        Artist(name: "Yoyo HoneySingh", image: "YoyoHoneySingh"),
        Artist(name: "HnumanKind", image: "Hnumankind"),
        Artist(name: "Emiway", image: "Emiway"),
        Artist(name: "KendrickLamar", image: "KendrickLamar"),
        Artist(name: "Paradox", image: "Paradox"),
        Artist(name: "No Artist", image: "Illuminati"),
        Artist(name: "Adity Gadhavi", image: "Adity Gadhavi"),
        Artist(name: "Kailash khair", image: "Kailash khair")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setCollectionView()
    }
    

    

}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "XIBArtistCell", bundle: nil), forCellWithReuseIdentifier: "XIBArtistCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XIBArtistCell", for: indexPath) as! XIBArtistCell
        cell.imgArtistImage.image = UIImage(named: artistArr[indexPath.row].image)
        cell.lblArtistName.text = artistArr[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 20, height: 195)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArtist = artistArr[indexPath.row]
                    
        let vc = UIStoryboard(name: "PlayList", bundle: nil).instantiateViewController(identifier: "SongListVC") as! SongListVC
                    
            vc.selectedArtistsname = selectedArtist.name
            
            navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
