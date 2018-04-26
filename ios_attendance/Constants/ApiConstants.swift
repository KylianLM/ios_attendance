//
//  File.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//
import Foundation

struct ApiConstants {
    static let makeFake = true

    struct Url {
        static let baseApi      = "http://www.perdu.com/api/"
        struct login {
            static let url      = ApiConstants.Url.baseApi + "login"
            static let method   = "GET"
        }
        struct refreshToken {
            static let url      = ApiConstants.Url.baseApi + "refreshToken"
            static let method   = "GET"
        }
        struct getLocation {
            static let url      = ApiConstants.Url.baseApi + "getLocation"
            static let method   = "GET"
        }
        struct checkIn {
            static let url      = ApiConstants.Url.baseApi + "checkIn"
            static let method   = "POST"
        }
    }
}
