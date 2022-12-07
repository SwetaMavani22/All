//
//  APIManager.swift

import UIKit
import Alamofire


let headers: HTTPHeaders = [
    .accept("application/json")
]

class APIManager: NSObject {
    
    // API Get Call Manager
    class func APIGetCalling(_ url: String, headers: HTTPHeaders? = nil, isShowProgress:Bool = true, success:@escaping (Any)->()) {
        
        if isShowProgress {
            showProgress("")
        }
        
        if (isConnectedToNetwork()) {
            AF.request(url, headers: headers).validate(contentType: ["application/json"]).responseJSON { response in
                debugPrint(response)
                
                if isShowProgress {
                    dismissProgress()
                }
                
                if let json = response.value {
                    success(json)
                } else if response.error != nil {
                    dismissProgress()
                    
                } else {
                    dismissProgress()
                    
                }
            }
        }
        else {
            if isShowProgress {
                dismissProgress()
            }
        }
    }
    
    // API Post Call Manager
    class func APIPostCalling(_ url: String, headers: HTTPHeaders? = nil, params:[String : Any]? = nil,isShowProgress:Bool = true, success:@escaping (Any)->()) {
        
        if isShowProgress {
            showProgress("")
        }
        
        if (isConnectedToNetwork()) {
            
            
            AF.request(API_URL.Login,method: .post, parameters: params)
                .validate(contentType: ["application/json"])
                .responseJSON { (response) in
                    print(response)
                    
                    if isShowProgress {
                        dismissProgress()
                    }
                    
                    if let json = response.value {
                        success(json)
                    } else if response.error != nil {
                        dismissProgress()
                    } else {
                        dismissProgress()
                    }
                }
        }
        else {
            if isShowProgress {
                dismissProgress()
            }
        }
    }
    
    
    class func APIPostCallingForData(_ url: String, headers: HTTPHeaders? = nil, params:[String : Any]? = nil,isShowProgress:Bool = true, success:@escaping (Any)->()) {
        
        if isShowProgress {
            showProgress("")
        }
        
        if (isConnectedToNetwork()) {
            
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                debugPrint(response.result)
                print("\n\n\nRequest URL :- \(url)\nParameters :- \(params)")
                
                if isShowProgress {
                    dismissProgress()
                }
                
                if let json = response.value {
                    success(json)
                } else if response.error != nil {
                    dismissProgress()
                } else {
                    dismissProgress()
                }
            }
        }
        else {
            if isShowProgress {
                dismissProgress()
            }
        }
    }
}

