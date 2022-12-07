//
//  ModelSideMenu.swift
//  InterviewTask_AthStar
//
//  Created by Mavani on 13/10/22.
//

import Foundation

class ModelSideMenu : NSObject {

    var error = ""
    var error_description = ""
    var data = [ModelSideMenuOption]()
    
    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        error = dic["error"] as? String ?? ""
        error_description = dic["error_description"] as? String ?? ""
        if let arr = dic["data"] as? [[String:Any]] {
            data = arr.map(ModelSideMenuOption.init)
        }
    }
}

class ModelSideMenuOption : NSObject {

    var Id = 0
    var Count = 0
    var SortOrder = 0.0
    var ColorCode = ""
    var Name = ""
    
    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        Id = dic["Id"] as? Int ?? 0
        Count = dic["Count"] as? Int ?? 0
        SortOrder = dic["SortOrder"] as? Double ?? 0.0
        ColorCode = dic["ColorCode"] as? String ?? ""
        Name = dic["Name"] as? String ?? ""
    }

}
