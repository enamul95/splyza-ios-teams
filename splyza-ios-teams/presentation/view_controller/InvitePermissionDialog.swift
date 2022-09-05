//
//  InvitePermissionDialog.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 5/9/22.
//

import UIKit

class InvitePermissionDialog: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    
    var arrPersimsion = [
        ["code":"manager" as AnyObject, "des":"Coach" as AnyObject],
        ["code":"editor" as AnyObject, "des":"Player Coach" as AnyObject],
        ["code":"member" as AnyObject, "des":"Player" as AnyObject],
        ["code":"readonly" as AnyObject, "des":"Supporter" as AnyObject]
      
    ]
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var uvBackground: UIView!
    
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
        cell.permissionLabel.text = arrPersimsion[indexPath.row]["des"] as? String
     
        cell.backgroundColor = .clear

        return cell;
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
