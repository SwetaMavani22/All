//
//  HomeVC.swift
//  InterviewTask_AthStar
//
//  Created by Mavani on 13/10/22.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblHome: UITableView!

    // MARK: - Variable Decleration
    var arrHomeData = [ModelHomeData]()
    var statusID = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GetHomeData(statusid: statusID)
    }
    
    // MARK: - Private Method
    func setDefault() {
        tblHome.delegate = self
        tblHome.dataSource = self
    }
    
    func GetHomeData(statusid : Int) {
        
        if (isConnectedToNetwork()) {
            
            if let token = Defualtss.value(forKey: UDKey.kToken) as? String {
                let headers: HTTPHeaders = [.authorization(bearerToken: token), .accept("application/json")]
                let params:[String:Any] = ["RegionId": 71, "StatusId": statusid]
                APIManager.APIPostCallingForData(API_URL.HomeData,headers : headers,params: params){ (response) in
                    //print(response)
                    dismissProgress()
                    let data = ModelHome.init(dic: response as? [String:Any] ?? [:])
                    if data.data.count > 0 {
                        self.arrHomeData = data.data
                        self.tblHome.reloadData()
                    } else {
                        self.view.makeToast(data.error_description)
                    }
                }
            }
        } else {
            dismissProgress()
            self.view.makeToast("Check your network connection")
        }
    }

    
    // MARK: - Button Action
    @IBAction func clickToSidemenu(_ sender: UIButton) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrHomeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tblHome.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeCell {
            
            cell.lblQuotationNumber.text = "QuotationNumber : \(arrHomeData[indexPath.row].QuotationNumber)"
            cell.lblAddress.text = "Address : \(arrHomeData[indexPath.row].Address)"
            cell.lblClientName.text = "ClientName : \(arrHomeData[indexPath.row].ClientName)"
            cell.lblCustomerName.text =  "CustomerName : \(arrHomeData[indexPath.row].CustomerName)"
            cell.lblSecondaryStatus.text = "SecondaryStatus : \(arrHomeData[indexPath.row].SecondaryStatus)"
            cell.lblSecondaryStatus.textColor = UIColor.init(hexString: arrHomeData[indexPath.row].SecondaryStatusColor)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
