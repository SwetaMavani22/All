//
//  ViewController.swift
//  iOS_Task_Logically
//
//  Created by Mavani on 23/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var arrInt = [4, 5, 7, 8, 2, 3, 5, 16, 20]
    var arr1:[Int] = [1, 2, 3, 4 , 4]
    var arr2:[Int] = [5, 6, 7, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getSecondLargeNumberFromArray()
        self.SortedArray()
    }
    
    func getSecondLargeNumberFromArray() {
        //arrInt.sort(by: >)
        for i in stride(from: arrInt.count-1, to: 0, by: -1) {
            for j in 1...i {
                if arrInt[j-1] < arrInt[j] {
                    let tmp = arrInt[j-1]
                    arrInt[j-1] = arrInt[j]
                    arrInt[j] = tmp
                }
            }
        }
        print(self.arrInt)
        print(self.arrInt[1])
    }
    
    
    func SortedArray() {
        var merged_array = arr1+arr2
        merged_array = Array(Set(merged_array))
        for i in stride(from: merged_array.count-1, to: 0, by: -1) {
            for j in 1...i {
                if merged_array[j-1] > merged_array[j] {
                    let tmp = merged_array[j-1]
                    merged_array[j-1] = merged_array[j]
                    merged_array[j] = tmp
                }
            }
        }
        print(merged_array)
        
    }
    
}

