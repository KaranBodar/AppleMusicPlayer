//
//  ProfileVC.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 21/04/25.
//

import UIKit

class ProfileVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var imgProfileImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    // MARK: - Variables -
    var userImage = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imgProfileImage.layer.cornerRadius = self.imgProfileImage.frame.height / 2
    }
    
    // MARK: - IBAction -
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func clickEditImage(_ sender: UIButton) {
        let alert = UIAlertController(title : "Caution",message: "Are you sure to want to select an Image", preferredStyle : .alert)
        let ok = UIAlertAction(title : "Ok",style: .default){  (_) in
            self.userImage.sourceType = .photoLibrary
            self.userImage.allowsEditing = true
            self.userImage.delegate = self
            self.present(self.userImage,animated: true)
        }
        alert.addAction(ok)
        let cancle = UIAlertAction(title : "Cancle",style: .destructive)
        alert.addAction(cancle)
        self.present(alert,animated: true)
    }
    @IBAction func clickChangePassword(_ sender: UIButton) {
        let alert = UIAlertController(title: "Change password", message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter old password"
            textField.becomeFirstResponder()
            textField.delegate = self
        }
        alert.addTextField { textField in
            textField.placeholder = "Enter new password"
            //            textField.becomeFirstResponder()
            textField.delegate = self
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let oldPassword = alert.textFields?[0].text
            let newPassword = alert.textFields?[1].text
            print("oldPassword: \(oldPassword ?? ""), newPassword: \(newPassword ?? "")")
            
        }))
        
        self.present(alert, animated: true)
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
    
    // MARK: - Function -
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageData = info[.editedImage] ?? info[.originalImage] as? UIImage{
            if let image = imageData as? UIImage{
                self.imgProfileImage.image = image
                self.dismiss(animated: true)
            }
        }
    }
}
