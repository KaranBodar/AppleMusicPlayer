//
//  SettingsVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 19/04/25.
//

import UIKit

class SettingsVC: UIViewController {

    // MARK: - IBOutlet -
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction -
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func clickLogout(_ sender: UIButton) {
        let alert = UIAlertController(title: "Logout.", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let logout = UIAlertAction(title: "Logout", style: .destructive) { (_) in
            name.set(false, forKey: "name")
            mobileNo.set(false, forKey: "mobileNo")
            email.set(false, forKey: "email")
            password.set(false, forKey: "password")
            confirmPassword.set(false, forKey: "confirmPassword")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainVC")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cancle = UIAlertAction(title: "Cancle", style: .cancel)
        alert.addAction(cancle)
        alert.addAction(logout)
        self.present(alert, animated: true)
    }
    @IBAction func clickDeleteAccount(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete Account.", message: "Are you sure you want to delete your account?", preferredStyle: .actionSheet)
        let deleteAccount = UIAlertAction(title: "DeleteAccount", style: .destructive) { (_) in
            name.set(false, forKey: "name")
            mobileNo.set(false, forKey: "mobileNo")
            email.set(false, forKey: "email")
            password.set(false, forKey: "password")
            confirmPassword.set(false, forKey: "confirmPassword")
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainVC")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cancle = UIAlertAction(title: "Cancle", style: .cancel)
        alert.addAction(cancle)
        alert.addAction(deleteAccount)
        self.present(alert, animated: true)
    }
    
}
