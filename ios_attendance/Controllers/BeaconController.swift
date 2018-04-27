//
//  BeaconController.swift
//  ios_attendance
//
//  Created by Thibaut Marsal on 27/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import UIKit
import CoreLocation

class BeaconController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var beaconList: UITableView!
    var beaconManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        beaconManager = CLLocationManager()
        beaconManager.delegate = self
        beaconManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            beaconManager.requestWhenInUseAuthorization()
        } else {
            print("OK")
            monitorBeacon()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    fileprivate func monitorBeacon () {
        let beaconUUID = UUID(uuidString: "F2A74FC4-7625-44DB-9B08-CB7E130B2029")
        let beaconIdentifier = "beacon"
        let beaconRegion = CLBeaconRegion(proximityUUID: beaconUUID!, identifier: beaconIdentifier)
        
        self.beaconManager.startMonitoring(for: beaconRegion)
        self.beaconManager.startRangingBeacons(in: beaconRegion)
    }

    //*
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print(beacons)
    }// */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
