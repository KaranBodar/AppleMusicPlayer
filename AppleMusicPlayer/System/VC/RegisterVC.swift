//
//  RegisterVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 17/04/25.
//

import UIKit
let name = UserDefaults.standard
let mobileNo = UserDefaults.standard
let email = UserDefaults.standard
let password = UserDefaults.standard
let confirmPassword = UserDefaults.standard


class RegisterVC: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    var empty = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction -
    @IBAction func clickRegister(_ sender: UIButton) {
        if self.txtName.text == self.empty && self.txtMobileNo.text == self.empty && self.txtEmail.text == self.empty && self.txtPassword.text == self.empty && self.txtConfirmPassword.text == self.empty {
            let alert = UIAlertController(title: "Can't proceed.", message: "Fill the given fields to continue.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        } else {
            name.set(true, forKey: "name")
            mobileNo.set(true, forKey: "mobileNo")
            email.set(true, forKey: "email")
            password.set(true, forKey: "password")
            confirmPassword.set(true, forKey: "confirmPassword")
            let vc = UIStoryboard(name: "PlayList", bundle: nil).instantiateViewController(identifier: "SongListVC")
//            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.setViewControllers( [vc], animated: true)
        }
    }
    @IBAction func clickCancle(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
