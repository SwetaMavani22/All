//
//  ModelUserData.swift
//  InterviewTask_AthStar
//
//  Created by Mavani on 13/10/22.
//

import Foundation

class ModelUser : NSObject {

    var error = ""
    var error_description = ""
    var Data = ModelUserData()
    
    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        error = dic["error"] as? String ?? ""
        error_description = dic["error_description"] as? String ?? ""
        Data = ModelUserData.init(dic: dic["Data"] as? [String:Any] ?? ["":""])
    }
}

class ModelUserData : NSObject {

    var Id = 0
    var SelectedRegionId = 0
    var Initial = ""
    var FirstName = ""
    var LastName = ""
    var Name = ""
    var PostalStreet = ""
    var PostalSubrub = ""
    var PostalState = ""
    var PostalPinCode = ""
    var Mobile = ""
    var Phone = ""
    var Email = ""
    var DateOfBirth = ""
    var DateOfJoining = ""
    
    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        Id = dic["Id"] as? Int ?? 0
        SelectedRegionId = dic["SelectedRegionId"] as? Int ?? 0
        Initial = dic["Initial"] as? String ?? ""
        FirstName = dic["FirstName"] as? String ?? ""
        LastName = dic["LastName"] as? String ?? ""
        Name = dic["Name"] as? String ?? ""
        PostalStreet = dic["PostalStreet"] as? String ?? ""
        PostalSubrub = dic["PostalSubrub"] as? String ?? ""
        PostalState = dic["PostalState"] as? String ?? ""
        PostalPinCode = dic["PostalPinCode"] as? String ?? ""
        Mobile = dic["Mobile"] as? String ?? ""
        Phone = dic["Phone"] as? String ?? ""
        Email = dic["Email"] as? String ?? ""
        DateOfBirth = dic["DateOfBirth"] as? String ?? ""
        DateOfJoining = dic["DateOfJoining"] as? String ?? ""
    }

}
