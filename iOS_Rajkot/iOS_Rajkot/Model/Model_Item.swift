//
//  Model_Item.swift
//  iOS_Rajkot
//
//  Created by Mavani on 18/11/22.
//

import Foundation

// MARK: - ItemJSON
struct ItemJSON: Codable {
    let id: String
    let name: [String]
    let price: Double
    let itemTaxes: [Double]
    let specifications: [Specification]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, price
        case itemTaxes = "item_taxes"
        case specifications = "specifications"
    }
}

// MARK: - Specification
struct Specification: Codable {
    let id: String
    let name: [String]
    let sequenceNumber, uniqueID: Int
    var list: [List]
    let maxRange, range, type: Int
    let isRequired: Bool
    let isParentAssociate: Bool?
    let modifierID: String?
    let modifierGroupID: String?
    let modifierGroupName: ModifierGroupName?
    let modifierName: String?
    let isAssociated, userCanAddSpecificationQuantity: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case sequenceNumber = "sequence_number"
        case uniqueID = "unique_id"
        case list
        case maxRange = "max_range"
        case range, type
        case isRequired = "is_required"
        case isParentAssociate
        case modifierID = "modifierId"
        case modifierGroupID = "modifierGroupId"
        case modifierGroupName, modifierName, isAssociated
        case userCanAddSpecificationQuantity = "user_can_add_specification_quantity"
    }
}

// MARK: - List
struct List: Codable {
    let id: String
    let name: [String]
    let price, sequenceNumber: Double
    let isDefaultSelected: Bool
    let specificationGroupID: String
    let uniqueID: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, price
        case sequenceNumber = "sequence_number"
        case isDefaultSelected = "is_default_selected"
        case specificationGroupID = "specification_group_id"
        case uniqueID = "unique_id"
    }
}

enum ModifierGroupName: String, Codable {
    case apartmentSize = "Apartment Size"
}
