//
//  UIController+Ext.swift
//  mExpense
//
//  Created by user1 on 26/10/21.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    func gotoHomeVC(statusID  : Int) {
        
        openSideMenu()
        let vc = UIStoryboard.instantiateViewController(storyborad: .main, withViewClass: HomeVC.self)
        vc.statusID = statusID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
