//
//  Settings.swift
//  Idle Jumping
//
//  Created by Caden Kowalski on 12/24/18.
//  Copyright © 2018 Caden Kowalski. All rights reserved.
//

import UIKit

var DismissInStoreState = true

class Settings: UIViewController {

    @IBOutlet weak var DismissInStore: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DismissInStoreState == true {
            DismissInStore.setOn(true, animated: true)
        } else {
            DismissInStore.setOn(false, animated: true)
        }
    }
    @IBAction func DismissInStorePressed(_ sender: Any) {
        UserDefaults.standard.set((sender as AnyObject).isOn, forKey: "switchState")
        if DismissInStoreState == true {
            DismissInStore.setOn(false, animated: true)
            DismissInStoreState = false
        } else {
            DismissInStore.setOn(true, animated: true)
            DismissInStoreState = true
        }
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
