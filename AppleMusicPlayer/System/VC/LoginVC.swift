//
//  LoginVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 17/04/25.
//

import UIKit

var enterEmail = String()

class LoginVC: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // MARK: - Variables -
    let empty = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction -
    
    @IBAction func txtEnterEmail(_ sender: UITextField) {
        
    }
    @IBAction func clickLogIn(_ sender: UIButton) {
        if self.txtEmail.text == self.empty || self.txtPassword.text == self.empty {
            let alert = UIAlertController(title: "Can't proceed.", message: "Fill the given fields to continue.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
            
        } else {
            email.set(true, forKey: "email")
            password.set(true, forKey: "password")
            let vc = UIStoryboard(name: "PlayList", bundle: nil).instantiateViewController(identifier: "HomeVC")
            self.navigationController?.setViewControllers( [vc], animated: true)
            enterEmail = self.txtEmail.text!
        }
    }
    @IBAction func clickCancle(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
