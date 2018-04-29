//
//  ApiClient.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation
import Arcane

class ApiClient {
    //Singleton
    static let sharedInstance = ApiClient()
    
    let session = URLSession.shared
    
    fileprivate func getUserToken() -> String? {
        return UserService.sharedInstance.getToken()
    }

    func postLogin(email: String, password: String, handler: @escaping (Bool) -> Swift.Void) -> URLSessionDataTask {
        let o: [String:String] = ["email": email, "password": Hash.SHA512(password)!]
        let u = URL(string: ApiConstants.Url.login.url)
        var request = URLRequest(url: u!)
        request.httpMethod = ApiConstants.Url.login.method
        request.httpBody = try? JSONSerialization.data(withJSONObject: o, options: [])
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        return session.dataTask(with: request, completionHandler: { (data, res, err) in
            DispatchQueue.main.async {
                if let d = data {
                    do {
                        if let o = (try JSONSerialization.jsonObject(with: d, options: [])) as? [String:String] {
                            if (o["token"] != nil) {
                                UserService.sharedInstance.storeToken(token: o["token"]!)
                                handler(true)
                            } else {
                                handler(false)
                            }
                        }
                    } catch _ {}
                } else {
                    handler(false)
                }
            }
        })
    }
    
    func postCheckIn(data : String, taskHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        if let token = getUserToken() {
            let o: [String: Any] = ["QRCodeData": data,
                                    "date": Formatter.iso8601.string(from: Date()),
                                    "beaconCollection": [],
                                    "token": token]
            let dataOut = try? JSONSerialization.data(withJSONObject: o)
            let u = URL(string: ApiConstants.Url.checkIn.url)
            
            var request = URLRequest(url: u!)
            request.httpMethod = ApiConstants.Url.checkIn.method
            request.httpBody = dataOut
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
            return session.dataTask(with: request, completionHandler: taskHandler)
        }
        return nil
    }
}

