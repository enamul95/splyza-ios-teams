//
//  ShareQRViewController.swift
//  splyza-ios-teams
//
//  Created by Enamul Haque on 6/9/22.
//

import UIKit

class ShareQRViewController: UIViewController{
    
    @IBOutlet weak var qrCode: UIImageView!
    
    var inviteUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let image = generateQRCode(from:inviteUrl)
        qrCode.image = image
    }
    
   
    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
}
