//
//  UserService.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 27/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation
import KeychainAccess

class UserService {
    //Singleton
    static let sharedInstance = UserService()
    
    func storePassword(password: String) {
        let keychain = Keychain(service: "com.iosattendance.www")
    
        DispatchQueue.global().async {
            do {
                try keychain
                    .accessibility(.whenPasscodeSetThisDeviceOnly, authenticationPolicy: .touchIDAny)
                    .set(password, key: "user_password")
            } catch let _ {
                // Error handling if needed...
            }
        }
    }
    
    func getPassword(handler: @escaping (String?) -> Void) {
        let keychain = Keychain(service: "com.iosattendance.www")
        print(keychain)
        DispatchQueue.global().async {
            do {
                let password = try keychain
                    .authenticationPrompt("Authenticate to login to server")
                    .get("user_password")
                handler(password)
            } catch let _ {
                // Error handling if needed...
            }
        }
    }
    
    func storeToken(token: String) {
        let keychain = Keychain(service: "com.iosattendance.www")
        
        keychain["user_token"] = token
    }
    
    func getToken() -> String? {
        let keychain = Keychain(service: "com.iosattendance.www")
        
        return keychain["user_token"]
    }
}
