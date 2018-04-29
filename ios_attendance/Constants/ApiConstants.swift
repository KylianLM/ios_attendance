//
//  File.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//
import Foundation

struct ApiConstants {

    // https://github.com/KylianLM/ios_attendance_nodejs_fakeApi
    struct Url {
        static let baseApi      = "http://localhost:8080/api/"
        struct login {
            static let url      = ApiConstants.Url.baseApi + "login"
            static let method   = "POST"
        }
        struct refreshToken {
            static let url      = ApiConstants.Url.baseApi + "refreshToken"
            static let method   = "POST"
        }
        struct getLocation {
            static let url      = ApiConstants.Url.baseApi + "getLocation"
            static let method   = "POST"
        }
        struct checkIn {
            static let url      = ApiConstants.Url.baseApi + "checkIn"
            static let method   = "POST"
        }
    }
}
