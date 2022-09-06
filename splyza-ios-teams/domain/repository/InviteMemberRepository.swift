//
//  InviteMemberRepository.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation


protocol InviteMemberRepository: AnyObject {
    
    func inviteMemberResponse(permission:PermissionDto)
}
