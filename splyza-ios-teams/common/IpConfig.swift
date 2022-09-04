//
//  IpConfig.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation
class IpConfig {
    
     public static func getIP() -> String {
         return Constrants.keyValues.BASE_URL
    }
}
