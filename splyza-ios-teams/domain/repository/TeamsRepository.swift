//
//  TeamsRepository.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation


protocol TeamsRepository: AnyObject {
    
    func getTeams(teams:TeamsDto)
}
