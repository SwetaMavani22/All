//
//  ViewController.swift
//  iOS_Rajkot
//
//  Created by Mavani on 18/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var tblFlat: UITableView!
    @IBOutlet var tblOptions: UITableView!
    
    @IBOutlet var lblTotal: UILabel!
    
    @IBOutlet var tblHeight: NSLayoutConstraint!
    @IBOutlet var tblHeightOption: NSLayoutConstraint!

    //MARK: - Variables
    var jsonData : ItemJSON?
    var selectedRows:[IndexPath] = []
    var selectedRadioButton : IndexPath?
    var selectedFlatList : List?
    
    var total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let result =  self.loadJson(filename: "item_data")
         print(result)*/
        
        self.loadJsonDecode(filename: "item_data", complation: {(data) in
            self.jsonData =  data
            self.selectedRadioButton = IndexPath(row: 0, section: 0)
            self.selectedFlatList = self.jsonData?.specifications[0].list[0]
            self.tblOptions.reloadData()
            self.tblFlat.reloadData()
        })
        
    }
    
    func loadJsonDecode(filename fileName: String , complation : @escaping ((ItemJSON) -> ())) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ItemJSON.self, from: data)
                complation(jsonData)
                
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    //MARK: - IBActions
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor.lightGray
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        if tableView == tblFlat {
            label.text = "Apartment Size"
        } else {
            label.text = jsonData?.specifications.filter({$0.modifierID == selectedFlatList?.id})[section].name.first
        }
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tblFlat {
            return 1
        } else {
            return (jsonData?.specifications.filter({$0.modifierID == selectedFlatList?.id}).count ?? 0)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblFlat {
            return jsonData?.specifications[0].list.count ?? 0
        } else {
            return jsonData?.specifications.filter({$0.modifierID == selectedFlatList?.id})[section].list.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblFlat {
            if let cell = self.tblFlat.dequeueReusableCell(withIdentifier: "cellSelectFlat") as? cellSelectFlat {
                
                cell.lblOption.text = jsonData?.specifications[0].list[indexPath.row].name.first
                
                cell.lblPrice.text = "\(jsonData?.specifications[0].list[indexPath.row].price ?? 0.0)"
                
                if selectedRadioButton == indexPath {
                    cell.imgSelect.image = UIImage(named: "ic_round_selected")
                } else {
                    cell.imgSelect.image = UIImage(named: "ic_round")
                }
                
                return cell
            }
        } else {
            if let cell = self.tblOptions.dequeueReusableCell(withIdentifier: "cellOptions") as? cellOptions {
                
                cell.lblPrice.text = "\(jsonData?.specifications.filter({$0.modifierID == selectedFlatList?.id})[indexPath.section].list.sorted(by: { $0.price < $1.price})[indexPath.row].price ?? 0.0)"
                
                cell.lblOption.text = "\(jsonData?.specifications.filter({$0.modifierID == selectedFlatList?.id})[indexPath.section].list[indexPath.row].name.first ?? "")"
                
                cell.btnCheck.tag = indexPath.row
                cell.btnCheck.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)
                if selectedRows.contains(indexPath) {
                    cell.btnCheck.setImage(UIImage(named:"ic_checkbox_selected"), for: .normal)
                }else{
                    cell.btnCheck.setImage(UIImage(named:"ic_checkbox"), for: .normal)
                }
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblFlat{
            selectedFlatList = jsonData?.specifications[indexPath.section].list[indexPath.row]
            selectedRadioButton = IndexPath(row: indexPath.row, section: indexPath.section)
            self.tblFlat.reloadData()
            self.tblOptions.reloadData()
        }
    }
    
    @objc func checkBoxSelection(_ sender:UIButton) {
        
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }
        guard let indexPath = tblOptions.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        print("button is in row \(indexPath.section)\(indexPath.row)")
        
        let selectedIndexPath = IndexPath(row: indexPath.row, section: indexPath.section)
        if self.selectedRows.contains(selectedIndexPath) {
            self.selectedRows.remove(at: self.selectedRows.firstIndex(of: selectedIndexPath)!)
        } else{
            self.selectedRows.append(selectedIndexPath)
        }
        self.tblOptions.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView == tblFlat {
            DispatchQueue.main.async {
                self.tblHeight.constant = self.tblFlat.contentSize.height
                //self.tblExcercise.reloadData()
            }
        } else {
            DispatchQueue.main.async {
                self.tblHeightOption.constant = self.tblOptions.contentSize.height
                //self.tblExcercise.reloadData()
            }
        }
    }
}
