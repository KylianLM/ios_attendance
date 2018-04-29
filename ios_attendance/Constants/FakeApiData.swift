//
//  ApiData.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation

struct FakeApiData {
    static let login = "{\"token\": \"1234567890123456789012345678901234567890\"}"
    static let refreshToken = "{\"token\": \"1234567890123456789012345678901234567890\"}"
    static let getLocation = "{\"date\": \"\",\"location\": \"Salle 7\"}"


    struct checkIn {
        struct Success {
            static let httpStatut = 200
        static let res = "{\"response\" : \"OK\"}"
        }
    
        struct Failed { 
            static let httpStatut = 404
            static let res = "{\"response\" : \"KO\"}"
        }
    }
}
