//
//  Constant.swift
//  InterviewTask
//
//  Created by Mavani on 11/10/22.
//

import Foundation


struct API_URL {
    
    static let BaseUrl = "https://qa-api.claimbuild.com"
    
    static let Login = BaseUrl+"/authenticate"
    static let SideMenuData = BaseUrl+"/v1/Main/GetMenu?id=71"
    static let UserData = BaseUrl+"/v1/User/GetLoggedUserDetails"
    static let HomeData = "https://qa-api.claimbuild.com/v1/Quotations/GetQuotationsByIds"
}

var Defualtss = UserDefaults.standard

struct UDKey {
    
    static let kIsSignIn              =  "kIsSignIn"
    static let kToken                 =  "kToken"
}

struct colors {
    static let themeColor             =  "1CB0D9"
    static let blackColor             =  "0C0C0E"
    static let grayColor              =  "7B8086"
    static let darkColor              =  "45484D"
    static let menuColor              =  "EDEFF2"
}
