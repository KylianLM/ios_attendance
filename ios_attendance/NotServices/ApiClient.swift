//
//  ApiClient.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation

class ApiClient {
    //Singleton
    static let sharedInstance = ApiClient()
    
    let session = URLSession.shared
    
    func postQRcode(data : String, taskHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        if ApiConstants.makeFake {
            // @TODO: Mock
        } else {
            let o: [String: Any] = ["QRCodeData": data,
                                       "date": Formatter.iso8601.string(from: Date()),
                                       "beaconCollection": BeaconService.sharedInstance.getBeaconsIn32(),
                                       "token": ""]
            let dataOut = try? JSONSerialization.data(withJSONObject: o)
            let u = URL(string: ApiConstants.Url.checkIn.url)
            var request = URLRequest(url: u!)
            request.httpMethod = ApiConstants.Url.checkIn.method
            
            let task = session.dataTask(with: request, completionHandler: taskHandler)
            return task
        }
        return nil
    }
}

