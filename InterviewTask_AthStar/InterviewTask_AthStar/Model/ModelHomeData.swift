//
//  ModelHomeData.swift
//  InterviewTask_AthStar
//
//  Created by Mavani on 14/10/22.
//

import Foundation

class ModelHome : NSObject {

    var error = ""
    var error_description = ""
    var data = [ModelHomeData]()

    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        error = dic["error"] as? String ?? ""
        error_description = dic["error_description"] as? String ?? ""
        if let arr = dic["data"] as? [[String:Any]] {
            data = arr.map(ModelHomeData.init)
        }
    }
}

class ModelHomeData : NSObject {

    var SecondaryStatusId = 0
    var GrandTotal = 0.0
    var Id = ""
    var QuotationNumber = ""
    var ClientName = ""
    var CustomerName = ""
    var Address = ""
    var Estimator = ""
    var SecondaryStatus = ""
    var SecondaryStatusColor = ""
    
    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        Id = dic["Id"] as? String ?? ""
        SecondaryStatusId = dic["SecondaryStatusId"] as? Int ?? 0
        GrandTotal = dic["GrandTotal"] as? Double ?? 0.0
        QuotationNumber = dic["QuotationNumber"] as? String ?? ""
        ClientName = dic["ClientName"] as? String ?? ""
        CustomerName = dic["CustomerName"] as? String ?? ""
        Address = dic["Address"] as? String ?? ""
        Estimator = dic["Estimator"] as? String ?? ""
        SecondaryStatus = dic["SecondaryStatus"] as? String ?? ""
        SecondaryStatusColor = dic["SecondaryStatusColor"] as? String ?? ""
    }

}
