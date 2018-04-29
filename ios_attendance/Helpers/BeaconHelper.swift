//
//  BeaconHelper.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 27/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import Foundation

class BeaconHelper {
    // Return an int for beaconCollection
    static func get32UInt(major: UInt16, minor: UInt16) -> UInt32 {
        return UInt32((UInt32(major) << 16) | UInt32(minor))
    }
}
