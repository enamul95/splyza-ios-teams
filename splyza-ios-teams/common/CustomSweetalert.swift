//
//  CustomSweetalert.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 6/9/22.
//

import Foundation

class CustomSweetAlert{
    
    static func showSuccessMessage(messsage: String?){
       
             SweetAlert().showAlert("Congratulation!", subTitle: messsage, style: AlertStyle.success)
    }
    
    static func showWarningMessage(messsage: String?){
        
             SweetAlert().showAlert("Attention!", subTitle: messsage, style: AlertStyle.warning)

    }
    
    static func showInternetConnection(){
      
            SweetAlert().showAlert("Internet Connection!", subTitle: "No Internet Connection !", style: AlertStyle.warning)
    }
  
}
