//
//  ModelPhotos.swift
//  InterviewTask
//
//  Created by Mavani on 11/10/22.
//

import Foundation

class ModelSignIn : NSObject {

    var access_token = ""
    var token_type = ""
    var refresh_token = ""
    var error = ""
    var error_description = ""
    var selected_regionId = 0
    var expires_in = 0

    override init() {
        super.init()
    }

    init(dic:[String:Any]) {

        selected_regionId = dic["selected_regionId"] as? Int ?? 0
        expires_in = dic["expires_in"] as? Int ?? 0
        access_token = dic["access_token"] as? String ?? ""
        token_type = dic["token_type"] as? String ?? ""
        refresh_token = dic["refresh_token"] as? String ?? ""
        error = dic["error"] as? String ?? ""
        error_description = dic["error_description"] as? String ?? ""
    }
}
