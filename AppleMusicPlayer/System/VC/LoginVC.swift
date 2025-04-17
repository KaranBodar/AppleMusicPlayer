//
//  LoginVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 17/04/25.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction -
    @IBAction func clickLogIn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func clickCancle(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

}
