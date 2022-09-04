//
//  TeamsViewModel.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import Foundation
import Alamofire

class TeamsViewModel {
    
    weak var errorRepositoryrDelegate: ErrorRepository?
    weak var teamsRepositoryDelegate: TeamsRepository?
    
    func getTeams(teamId:String){
        
        var url = URL(string: IpConfig.getIP()+"v1/teams/")!
        url.appendPathComponent("\(teamId)")
    
        AF.request(url, method: .get).response { response in
          
            if let data = response.data {
                do{
                    let responseJson = try JSONDecoder().decode(TeamsDto.self, from: data)
                    self.teamsRepositoryDelegate?.getTeams(teams: responseJson)
                }catch let err{
                  print("error--",err as! LocalizedError)
                    self.errorRepositoryrDelegate?.error(errorFrom: "getTeams",error: err as! LocalizedError)

                }
            }else{
                //self.errorDelegate?.error(errorFrom: "Source Ac  ")
            }
        }
    }
}
