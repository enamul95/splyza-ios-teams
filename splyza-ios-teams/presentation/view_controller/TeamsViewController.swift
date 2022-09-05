//
//  TeamsViewController.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 4/9/22.
//

import UIKit

class TeamsViewController: UIViewController, TeamsRepository,ErrorRepository ,UITextFieldDelegate{

    @IBOutlet weak var currentMembersLabel: UILabel!
    @IBOutlet weak var currentMemberLimitLabel: UILabel!
    @IBOutlet weak var currentSupporterLabel: UILabel!
    
    @IBOutlet weak var currentSupporterLimitLabel: UILabel!
    @IBOutlet weak var invitePermsionText: UITextField!
    
    @IBOutlet weak var currentSupportStackViewHeight: NSLayoutConstraint!
    
    var teamsViewModel = TeamsViewModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsViewModel.teamsRepositoryDelegate = self
        teamsViewModel.errorRepositoryrDelegate = self
        invitePermsionText.delegate = self
        
        
        invitePermsionText.rightViewMode = .always
        let imageView = UIImageView(frame: CGRect(x:0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "arrow-down")
        imageView.image = image
        invitePermsionText.rightView = imageView
        
    
        invitePermsionText.addTarget(self, action: #selector(invitePermsionTextClick), for: .touchDown)
        
        teamsViewModel.getTeams(teamId: Constrants.keyValues.teamId)
        
        
        
        
    }
    

    @objc func invitePermsionTextClick(_ textField: UITextField) {
       
       let  vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InvitePermissionDialog") as! InvitePermissionDialog
        self.addChild(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
      
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
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
        if(teams.members.supporters > 0){
            currentSupporterLabel.text = Constrants.keyValues.TEAMS_CURRENT_SUPPORTERS + " " + String(teams.members.supporters)
            currentSupporterLimitLabel.text = Constrants.keyValues.LIMIT + " " + String(teams.plan.supporterLimit)
        }else{
            currentSupportStackViewHeight.constant = 0
        }
        
        
        
    
    }
    


}
