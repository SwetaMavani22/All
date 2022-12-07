//
//  model_Currency.swift
//  SwitUI_Task
//
//  Created by Mavani on 22/11/22.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currencyModel = try? newJSONDecoder().decode(CurrencyModel.self, from: jsonData)

import Foundation

// MARK: - CurrencyModel
struct CurrencyModel: Codable {
    let time: Time
    let disclaimer, chartName: String
    let bpi: Bpi
}

// MARK: - Bpi
struct Bpi: Codable {
    let usd, gbp, eur: Eur

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

// MARK: - Eur
struct Eur: Codable {
    let code, symbol, rate, eurDescription: String
    let rateFloat: Double

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate
        case eurDescription = "description"
        case rateFloat = "rate_float"
    }
}

// MARK: - Time
struct Time: Codable {
    let updated: String
    let updatedISO: String
    let updateduk: String
}
