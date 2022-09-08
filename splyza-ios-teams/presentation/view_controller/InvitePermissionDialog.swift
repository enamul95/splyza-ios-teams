//
//  InvitePermissionDialog.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 5/9/22.
//

import UIKit

class InvitePermissionDialog: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var teams: TeamsDto? = nil
    
    weak var roleSelectRepositoryDelegate: RoleSelectRepository?

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var uvBackground: UIView!
    
    
    var arrPersimsion = [
        ["role":"manager" as AnyObject, "des":"Coach" as AnyObject],
        ["role":"editor" as AnyObject, "des":"Player Coach" as AnyObject],
        ["role":"member" as AnyObject, "des":"Player" as AnyObject],
        ["role":"readonly" as AnyObject, "des":"Supporter" as AnyObject]
      
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uvBackground.backgroundColor =  UIColor.black.withAlphaComponent(0.7)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        showAnimate()
    }
    
    @IBAction func btnClose(_ sender: Any) {
        removeAnimate()
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPersimsion.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PermissionTableViewCell;
        
        
        
        if(teams?.plan.supporterLimit == 0 && arrPersimsion[indexPath.row]["role"] as! String == "readonly"){
            cell.isHidden = true
        }else{
            
            var currentMember = teams!.members.administrators + teams!.members.managers + teams!.members.editors + teams!.members.members

            if( currentMember >= (teams?.plan.memberLimit)! &&  arrPersimsion[indexPath.row]["role"] as! String != "readonly"){
                cell.isUserInteractionEnabled = false
               
            }else{
                cell.selectionStyle = .default
            }
            
            if((teams?.plan.supporterLimit)! <= (teams?.members.supporters)! && arrPersimsion[indexPath.row]["role"] as! String == "readonly"){

               cell.isUserInteractionEnabled = false
           }
            
            cell.permissionLabel.text = arrPersimsion[indexPath.row]["des"] as? String
         
            cell.backgroundColor = .clear
        }
        
       
       
       
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let role = arrPersimsion[indexPath.row]["role"] as? String
        self.roleSelectRepositoryDelegate?.roleselectedItem(role: role!)
        removeAnimate()
    }
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
  

}
