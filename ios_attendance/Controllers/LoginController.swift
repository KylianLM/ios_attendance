//
//  LoginController.swift
//  ios_attendance
//
//  Created by Thibaut Marsal on 27/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import UIKit
import Arcane

class LoginController: UIViewController {
    @IBOutlet weak var nicknameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func errorModal (title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginActionButton(_ sender: Any) {
        let nickname = self.nicknameInput.text
        let password = self.passwordInput.text
        
        if ((nickname?.isEmpty)! || (password?.isEmpty)!) {
            print("error")
            self.errorModal(title: "Login error", message: "an error occured please double check your nickname and password")
        }
        else {
            self.login(nickname: nickname!, password: password!)
        }
    }
    
    fileprivate func login (nickname: String, password: String) {

                if let next = self.storyboard?.instantiateViewController(withIdentifier: "qrCode") as? QRScannerController {
                    self.navigationController?.pushViewController(next, animated: true)
                }

    }

}
