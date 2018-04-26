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
        static let login        = ApiConstants.Url.baseApi + "login"
        static let refreshToken = ApiConstants.Url.baseApi + "refreshToken"
        static let getLocation  = ApiConstants.Url.baseApi + "getLocation"
        static let checkIn      = ApiConstants.Url.baseApi + "checkIn"
    }
}
