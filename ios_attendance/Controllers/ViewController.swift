//
//  ViewController.swift
//  ios_attendance
//
//  Created by Kylian Le Mette on 26/04/2018.
//  Copyright © 2018 Kylian Le Mette. All rights reserved.
//

import UIKit
import Arcane

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view, typically from a nib.
        print(!UserDefaults.standard.bool(forKey: "check"))
        if !UserDefaults.standard.bool(forKey: "check") {
            if let next = self.storyboard?.instantiateViewController(withIdentifier: "qrCode") as? QRScannerController {
                self.navigationController?.pushViewController(next, animated: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

