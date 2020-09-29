//
//  Level_2.swift
//  Idle Jumping
//
//  Created by Caden Kowalski on 12/23/18.
//  Copyright © 2018 Caden Kowalski. All rights reserved.
//

import UIKit

class Level_2: UIViewController {

    @IBOutlet weak var Player: UIImageView!
    @IBOutlet weak var Coin: UIImageView!
    @IBOutlet weak var Money: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Money.text = String(CurrentMoney)
        Coin.isHidden = false
    }
    
    @IBAction func ScreenTapped(_ sender: Any) {
        self.view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1, animations: {self.Player.frame = CGRect(x: 56, y: 490, width: 273, height: 236)})
        UIView.animate(withDuration: 0.2, animations: {self.Player.frame = CGRect(x: 56, y: 573, width: 273, height: 236)})
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.Coin.isHidden = true
            CurrentMoney += CoinValue
            self.Money.text = String(CurrentMoney)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(WaitTime), execute: {
                self.Coin.isHidden = false
                self.view.isUserInteractionEnabled = true
            })
        })
    }
}
