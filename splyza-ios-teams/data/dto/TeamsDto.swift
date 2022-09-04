//
//  TeamsDto.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation

struct TeamsDto: Codable {
    let id: String
    let members: Members
    let plan: Plan
    

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case members = "members"
        case plan = "plan"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)!
        members = try values.decodeIfPresent(Members.self, forKey: .members)!
        plan = try values.decodeIfPresent(Plan.self, forKey: .plan)!
    }
}

struct Members: Codable {
    
    let administrators: Int
    let editors: Int
    let managers: Int
    let members:Int
    let supporters: Int
    let total : Int
    
    enum CodingKeys: String, CodingKey {
        case administrators = "administrators"
        case editors = "editors"
        case managers = "managers"
        case members = "members"
        case supporters = "supporters"
        case total = "total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        administrators = try values.decodeIfPresent(Int.self, forKey: .administrators)!
        editors = try values.decodeIfPresent(Int.self, forKey: .editors)!
        managers = try values.decodeIfPresent(Int.self, forKey: .managers)!
        members = try values.decodeIfPresent(Int.self, forKey: .members)!
        supporters = try values.decodeIfPresent(Int.self, forKey: .supporters)!
        total = try values.decodeIfPresent(Int.self, forKey: .total)!
    }
}

struct Plan: Codable {
    
    let memberLimit:Int
    let supporterLimit: Int
    
    enum CodingKeys: String, CodingKey {
        case memberLimit = "memberLimit"
        case supporterLimit = "supporterLimit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        memberLimit = try values.decodeIfPresent(Int.self, forKey: .memberLimit)!
        supporterLimit = try values.decodeIfPresent(Int.self, forKey: .supporterLimit)!

    }
}
