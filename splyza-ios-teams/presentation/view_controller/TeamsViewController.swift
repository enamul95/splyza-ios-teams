//
//  TeamsViewController.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import UIKit

class TeamsViewController: UIViewController, TeamsRepository,ErrorRepository {

    @IBOutlet weak var currentMembersLabel: UILabel!
    @IBOutlet weak var currentMemberLimitLabel: UILabel!
    @IBOutlet weak var currentSupporterLabel: UILabel!
    
    @IBOutlet weak var currentSupporterLimitLabel: UILabel!
    @IBOutlet weak var invitePermsionText: UITextField!
    
    var teamsViewModel = TeamsViewModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsViewModel.teamsRepositoryDelegate = self
        teamsViewModel.errorRepositoryrDelegate = self
        
        teamsViewModel.getTeams(teamId: Constrants.keyValues.teamId)
        
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }
    
    
    @IBAction func btnShareQR(_ sender: Any) {
        
    }
    
    @IBAction func btnCopyLink(_ sender: Any) {
        
    }
    
    func error(errorFrom: String, error: LocalizedError) {
        print(errorFrom)
    }
    
    func getTeams(teams: TeamsDto) {
       let currentMember = teams.members.administrators + teams.members.managers + teams.members.editors + teams.members.members
      
        currentMembersLabel.text = Constrants.keyValues.TEAMS_CURRENT_MEMBERS + " " + String(currentMember)
        currentMemberLimitLabel.text =  Constrants.keyValues.LIMIT + " " + String(teams.plan.memberLimit)
        currentSupporterLabel.text = Constrants.keyValues.TEAMS_CURRENT_SUPPORTERS + " " + String(teams.members.supporters)
        currentSupporterLimitLabel.text = Constrants.keyValues.LIMIT + " " + String(teams.plan.supporterLimit)
    
    }
    


}
