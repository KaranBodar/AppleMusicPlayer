//
//  RegisterVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 17/04/25.
//

import UIKit
var name = UserDefaults.standard
var mobileNo = UserDefaults.standard
var email = UserDefaults.standard
var password = UserDefaults.standard
var confirmPassword = UserDefaults.standard
var profileImage = UserDefaults.standard

var enterName: String?

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
    
    @IBAction func txtEnterName(_ sender: UITextField) {
//        enterName = sender.text ?? ""
//        UserDefaults.standard.set(enterName, forKey: "name")
        
    }
    
    @IBAction func clickRegister(_ sender: UIButton) {
        if self.txtName.text == self.empty || self.txtMobileNo.text == self.empty || self.txtEmail.text == self.empty || self.txtPassword.text == self.empty || self.txtConfirmPassword.text == self.empty {
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
            let vc = UIStoryboard(name: "PlayList", bundle: nil).instantiateViewController(identifier: "HomeVC")
            self.navigationController?.setViewControllers( [vc], animated: true)
            enterName = self.txtName.text ?? ""

        }
    }
    @IBAction func clickCancle(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
