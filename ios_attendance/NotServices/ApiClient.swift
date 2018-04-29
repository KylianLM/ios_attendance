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
    

    func postLogin(email: String, password: String, taskHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        let o: [String:String] = ["email": email, "token": Hash.SHA512(password)!]
        
        let u = URL(string: ApiConstants.Url.login.url)
        var request = URLRequest(url: u!)
        request.httpMethod = ApiConstants.Url.login.method
        request.httpBody = try? JSONSerialization.data(withJSONObject: o)
        
        return session.dataTask(with: request, completionHandler: taskHandler)
    }
    
    func postQRcode(data : String, taskHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        let o: [String: Any] = ["QRCodeData": data,
                                "date": Formatter.iso8601.string(from: Date()),
                                "beaconCollection": [],
                                "token": ""]
        let dataOut = try? JSONSerialization.data(withJSONObject: o)
        let u = URL(string: ApiConstants.Url.checkIn.url)
            
        var request = URLRequest(url: u!)
        request.httpMethod = ApiConstants.Url.checkIn.method
        request.httpBody = dataOut
        return session.dataTask(with: request, completionHandler: taskHandler)

    }
}

