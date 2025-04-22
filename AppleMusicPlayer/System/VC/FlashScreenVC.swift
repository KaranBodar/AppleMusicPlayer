//
//  FlashScreenVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 18/04/25.
//

import UIKit

class FlashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if name.bool(forKey: "name") || email.bool(forKey: "email") || password.bool(forKey: "password") || confirmPassword.bool(forKey: "confirmPassword") || mobileNo.bool(forKey: "mobileNo") == true  {
                    
                let vc = UIStoryboard(name: "PlayList", bundle: nil).instantiateViewController(identifier: "HomeVC")
                self.navigationController?.setViewControllers([vc], animated: true)
                } else {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainVC")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
    }
    

    

}
