//
//  ErrorRepository.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation


protocol ErrorRepository: AnyObject {
    func error(errorFrom:String,error:LocalizedError)
}
