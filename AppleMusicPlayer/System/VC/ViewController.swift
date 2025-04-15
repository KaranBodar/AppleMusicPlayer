//
//  ViewController.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import UIKit

class ViewController: UIViewController{
    // MARK: - IBOutlets -
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables -
    var song = [Song] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpCollectionView()
    }
    // MARK: - IBActions -
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func clickSettings(_ sender: UIButton) {
        
    }
}
// MARK: - Functions -
extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func setUpCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "XIBArtistCollectionCell", bundle: nil), forCellWithReuseIdentifier: "XIBArtistCollectionCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.song.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XIBArtistCollectionCell", for: indexPath)
        return  cell
    }
    
}
