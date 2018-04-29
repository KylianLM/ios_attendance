//BeaconService.swift

import Foundation
import CoreLocation

class BeaconService: NSObject, CLLocationManagerDelegate {
    //Singleton
    static let sharedInstance = BeaconService()
    var beaconManager: CLLocationManager!
    var beacons = [CLBeacon]()
    
    // Demande l'autorisation et lance
    // Lance le monitoring
    func start() -> Swift.Void
    {
        beaconManager = CLLocationManager()
        beaconManager.delegate = self
        beaconManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            beaconManager.requestWhenInUseAuthorization()
        } else {
            monitor()
        }
    }
    
    // monitor les beacons
    fileprivate func monitor()
    {
        let beaconUUID = UUID(uuidString: "F2A74FC4-7625-44DB-9B08-CB7E130B2029")
        let beaconIdentifier = "beacon"
        let beaconRegion = CLBeaconRegion(proximityUUID: beaconUUID!, identifier: beaconIdentifier)
        
        self.beaconManager.startMonitoring(for: beaconRegion)
        self.beaconManager.startRangingBeacons(in: beaconRegion)
    }
    
    // Ecoute les changements de beacons
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion)
    {
        self.beacons = beacons
    }
    
    // Map beacons with BeaconHelper.get32UInt method
    func getBeaconsIn32() -> [UInt32]
    {
        var beaconData = [UInt32]()
        for beacon in self.beacons {
            beaconData.append(UInt32(BeaconHelper.get32UInt(major: UInt16(beacon.minor), minor: UInt16(beacon.major))))
        }
        return beaconData
    }
}
