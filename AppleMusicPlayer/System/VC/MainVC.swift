//
//  MainVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 17/04/25.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction -
    @IBAction func clickLogIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func clickRegister(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
