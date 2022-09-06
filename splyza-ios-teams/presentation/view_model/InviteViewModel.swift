//
//  InvitePermissionViewModel.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 6/9/22.
//

import Foundation
import Alamofire

class InviteViewModel{
    
    weak var errorRepositoryrDelegate: ErrorRepository?
    weak var inviteMemberRepositoryDelegate: InviteMemberRepository?
    
    func inviteMember(teamId:String,`var` parameters: [String: Any]){
        
        var url = URL(string: IpConfig.getIP()+"v1/teams/")!
        url.appendPathComponent("\(teamId)"+"/invites")
    
        AF.request(url, method: .post,parameters: parameters,encoding: JSONEncoding.default, headers: nil).response { response in
            if let data = response.data {
                do{
                    let responseJson = try JSONDecoder().decode(PermissionDto.self, from: data)
                    self.inviteMemberRepositoryDelegate?.inviteMemberResponse(permission: responseJson)
                    
                }catch let err{
                    self.errorRepositoryrDelegate?.error(errorFrom: "invite",error: err as! LocalizedError)

                }
            }else{

            }
        }
    }
}
