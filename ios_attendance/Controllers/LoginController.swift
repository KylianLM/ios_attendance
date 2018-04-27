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
        var password = self.passwordInput.text
        
        if ((nickname?.isEmpty)! || (password?.isEmpty)!) {
            print("error")
            self.errorModal(title: "Login error", message: "an error occured please double check your nickname and password")
        }
        else {
            password = Hash.SHA512(password!)
            self.login(nickname: nickname, password: password)
        }
    }
    
    fileprivate func login (nickname: String?, password: String? ) {
        //print(nickname)
        //print(password)
        
        // TODO: Make Api request with nickname and password to the Login Api
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
