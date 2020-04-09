//
//  ViewController.swift
//  oDocPatientSdkiOS
//
//  Created by Damith Lakshitha on 2/27/20.
//  Copyright © 2020 oDoc. All rights reserved.
//

// import oDocPatientSdk
import oDocPatientSdk
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openSDKButtonTapped(_ sender: Any) {
        let odocsdk = oDocPatientSdk.shared
        do {
            odocsdk.phoneNumber = "715992537"
            odocsdk.firstName = "Damith"
            odocsdk.lastName = "laksitha"
            odocsdk.appId = "1.0.0_test_1"
            odocsdk.mode = .development
            odocsdk.jsonData = ""
            odocsdk.authToken = UserDefaults.standard.value(forKey: Properties.authToken) as? String

            odocsdk.attachDelegate(withSuccess: { response in

                let token = response[Properties.authToken] as? String
                UserDefaults.standard.set(token, forKey: Properties.authToken)
            })

            let sdkVC = try odocsdk.createVC()

            sdkVC.hidesBottomBarWhenPushed = true
            sdkVC.modalPresentationStyle = .fullScreen
            self.present(sdkVC, animated: true)

        } catch {
            print("error")
        }
    }
}
