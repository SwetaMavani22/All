//
//  SidemenuVC.swift
//  Photonic
//
//  Created by ViPrak-Ankit on 11/01/22.
//

import UIKit
import Alamofire


class SidemenuVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblSidemenu: UITableView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!

    // MARK: - Variable Decleration
    var selectedMenu = 0
    var arrSideMenu = [ModelSideMenuOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDefault()
        NotificationCenter.default.addObserver(self, selector: #selector(setDefault), name: NSNotification.Name(rawValue: "MFSidemenu_Open"), object: nil)
    }
    
    // MARK: - Private Method
    @objc func setDefault() {
        tblSidemenu.delegate = self
        tblSidemenu.dataSource = self
        self.GetUserData()
        self.GetSideMenuData()
    }
    
    func GetSideMenuData() {
        
        if (isConnectedToNetwork()) {
            if let token = Defualtss.value(forKey: UDKey.kToken) as? String {
                let headers: HTTPHeaders = [.authorization(bearerToken: token), .accept("application/json")]
                dismissProgress()
                APIManager.APIGetCalling(API_URL.SideMenuData, headers: headers, isShowProgress: false , success: { (response) in
                    print(response)
                    let data = ModelSideMenu.init(dic: response as? [String:Any] ?? [:])
                    if data.data.count > 0 {
                        self.arrSideMenu = data.data
                        self.tblSidemenu.reloadData()
                    }
                })
            }
        } else {
            dismissProgress()
            self.view.makeToast("Check your network connection")
        }
      
    }
    
    func GetUserData() {
        
        if (isConnectedToNetwork()) {
            if let token = Defualtss.value(forKey: UDKey.kToken) as? String {
                let headers: HTTPHeaders = [.authorization(bearerToken: token), .accept("application/json")]
                APIManager.APIGetCalling(API_URL.UserData, headers: headers, isShowProgress: false , success: { (response) in
                    //print(response)
                    dismissProgress()
                    let data = ModelUser.init(dic: response as? [String:Any] ?? [:])
                    if data.error_description == "Success" {
                        self.lblName.text = data.Data.Name
                        self.lblEmail.text = data.Data.Email
                    }
                })
            }
        } else {
            dismissProgress()
            self.view.makeToast("Check your network connection")
        }
        
    }

    
    // MARK: - Button Action
    @IBAction func clickToClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
        
    @IBAction func clickToTerms(_ sender: UIButton) {
        
    }
    
    @IBAction func clickToLogout(_ sender: UIButton) {
        
        Defualtss.removeObject(forKey: UDKey.kToken)
        Defualtss.removeObject(forKey: UDKey.kIsSignIn)
        Defualtss.synchronize()
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func clickToSetting(_ sender: UIButton) {
    }

}

extension SidemenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSideMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tblSidemenu.dequeueReusableCell(withIdentifier: "SidemenuCell") as? SidemenuCell {
            
            cell.lblMenu.text = arrSideMenu[indexPath.row].Name
            cell.viewBackground.backgroundColor = (selectedMenu == indexPath.row) ? UIColor.init(hexString: colors.menuColor) : UIColor.white
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMenu = indexPath.row
        tblSidemenu.reloadData()
        self.gotoHomeVC(statusID: arrSideMenu[indexPath.row].Id)
    }
    
}
