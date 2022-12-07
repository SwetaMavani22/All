//
//  SignInVC.swift
//  Photonic
//
//  Created by ViPrak-Ankit on 10/01/22.
//

import UIKit
import Alamofire

class SignInVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    // MARK: - Variable Decleration
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDefault()
    }
    
    // MARK: - Private Method
    func setDefault() {
        
        txtEmail.text = "ankur@nthstar.com.au"
        txtPassword.text = "ankur@995"

        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email address",attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(hexString: colors.grayColor)])
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(hexString: colors.grayColor)])
    }
    
    func loginData() {
        
        if (isConnectedToNetwork()) {
            
            let params:[String:Any] = [ "grant_type" : "password" , "username": self.txtEmail.text ?? "", "password": txtPassword.text ?? "" ]
            
            APIManager.APIPostCalling(API_URL.Login, params: params){ (response) in
                //print(response)
                dismissProgress()
                let data = ModelSignIn.init(dic: response as? [String:Any] ?? [:])
                if data.access_token != "" {
                    Defualtss.setValue(data.access_token, forKey: UDKey.kToken)
                    Defualtss.set(true, forKey: UDKey.kIsSignIn)
                    self.gotoHomeVC(statusID: 1)
                } else {
                    self.view.makeToast(data.error_description)
                }
            }
        } else {
            dismissProgress()
            self.view.makeToast("Check your network connection")
        }
    }
    
    // MARK: - Button Action
    @IBAction func clickToShowPassword(_ sender: UIButton) {
        if (txtPassword.isSecureTextEntry) {
            btnShowPassword.setImage(UIImage.init(named: "ic_show_pass"), for: .normal)
        } else {
            btnShowPassword.setImage(UIImage.init(named: "ic_hide_pass"), for: .normal)
        }
        txtPassword.togglePasswordVisibility()
    }
    
    @IBAction func clickToForgotPassword(_ sender: UIButton) {}
    
    @IBAction func clickToSignIn(_ sender: UIButton) {
        
        if let email = self.txtEmail.text, email.isEmpty {
            self.view.makeToast("Please enter email.")
        } else if let password = self.txtPassword.text, password.isEmpty {
            self.view.makeToast("Please enter password.")
        } else {
            self.loginData()
        }
    }
    
    @IBAction func clickToSignUp(_ sender: UIButton) {}

}
