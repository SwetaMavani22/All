//
//  API_Manager.swift
//  SwitUI_Task
//
//  Created by Mavani on 22/11/22.
//

import Foundation

class Api : ObservableObject{
    
    @Published var data : CurrencyModel?
    
    func loadData(completion:@escaping (CurrencyModel) -> ()) {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let data = try! JSONDecoder().decode(CurrencyModel.self, from: data!)
            print(data)
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
        
    }
}
