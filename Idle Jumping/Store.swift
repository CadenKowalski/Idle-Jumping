//
//  Store.swift
//  Idle Jumping
//
//  Created by Caden Kowalski on 12/23/18.
//  Copyright © 2018 Caden Kowalski. All rights reserved.
//

import UIKit

var NextLvlCoinsCostPrint = "10"
var NextLvlCostPrint = "50"
var WaitTimeCostPrint = "10"
var NextLvlCoinCost = 10
var NextLvlCost = 50
var NextWaitTimeCost = 10
class Store: UIViewController {

    @IBOutlet weak var NextLvlCoinCostLbl: UILabel!
    @IBOutlet weak var NextLvlCostLbl: UILabel!
    @IBOutlet weak var NotEnoughCoins: UILabel!
    @IBOutlet weak var FasterTappingCostLbl: UILabel!
    @IBOutlet weak var AutoTappingCostLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
        NextLvlCostLbl.text = NextLvlCostPrint
        FasterTappingCostLbl.text = WaitTimeCostPrint
        NotEnoughCoins.isHidden = true
    }
    
    func UpdateforCoins() {
        CoinValue *= 2
        CurrentMoney -= NextLvlCoinCost
        CoinLvl += 1
    }
    
    func UpdateforNextLvl() {
        CurrentMoney -= NextLvlCost
        CoinValue *= 10
        CurrentLvl += 1
    }
    
    func UpdateforFasterTapping() {
        CurrentMoney -= NextWaitTimeCost
        if WaitTime > 200 {
            WaitTime -= 200
        } else {
            WaitTime -= 50
        }
        WaitTimeLvl += 1
    }
    
    func Dismiss() {
        if DismissInStoreState == true {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func Wait() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.NotEnoughCoins.isHidden = true
        })
    }
    
    @IBAction func IncreaseCoinValue(_ sender: Any) {
        switch CoinLvl {
        case 1:
            if CurrentMoney >= 10 {
                UpdateforCoins()
                NextLvlCoinCost = 100
                NextLvlCoinsCostPrint = "100"
                self.NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
                Dismiss()
            }
            else {
                NotEnoughCoins.isHidden = false
                Wait()
            }
        case 2:
            if CurrentMoney >= 100 {
                UpdateforCoins()
                NextLvlCoinCost = 10000
                NextLvlCoinsCostPrint = "10,000"
                self.NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 3:
            if CurrentMoney >= 10000 {
                UpdateforCoins()
                NextLvlCoinCost = 100000000
                NextLvlCoinsCostPrint = "100M"
                self.NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 4:
            if CurrentMoney >= 100000000 {
                UpdateforCoins()
                NextLvlCoinCost = 1000000000
                NextLvlCoinsCostPrint = "1B"
                self.NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 5:
            if CurrentMoney >= 1000000000 {
                UpdateforCoins()
                NextLvlCoinsCostPrint = "N/A"
                self.NextLvlCoinCostLbl.text = NextLvlCoinsCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        default:
            self.NextLvlCoinCostLbl.text = "N/A"
        }
    }
    @IBAction func NextLvl(_ sender: Any) {
        switch CurrentLvl {
        case 1:
            if CurrentMoney >= 50 {
                UpdateforNextLvl()
                NextLvlCost = 2500
                NextLvlCostPrint = "2,500"
                self.NextLvlCostLbl.text = NextLvlCostPrint
                performSegue(withIdentifier: "Level_2", sender: sender)
            }
            else {
                NotEnoughCoins.isHidden = false
                Wait()
            }
        case 2:
            if CurrentMoney >= 2500 {
                UpdateforNextLvl()
                NextLvlCost = 6250000
                NextLvlCostPrint = "6,250,000"
                self.NextLvlCostLbl.text = NextLvlCostPrint
                performSegue(withIdentifier: "Level_3", sender: sender)
            }
            else {
                NotEnoughCoins.isHidden = false
                Wait()
            }
        case 3:
            if CurrentMoney >= 6250000 {
                UpdateforNextLvl()
                NextLvlCost = 1000000000
                NextLvlCostPrint = "1B"
                self.NextLvlCostLbl.text = NextLvlCostPrint
                performSegue(withIdentifier: "Level_4", sender: sender)
            }
            else {
                NotEnoughCoins.isHidden = false
                Wait()
            }
        case 4:
            if CurrentMoney >= 1000000000 {
                UpdateforNextLvl()
                NextLvlCostPrint = "N/A"
                self.NextLvlCostLbl.text = NextLvlCostPrint
                performSegue(withIdentifier: "Level_5", sender: sender)
            }
            else {
                NotEnoughCoins.isHidden = false
                Wait()
            }
        default:
            self.NextLvlCostLbl.text = NextLvlCostPrint
        }
    }
    
    @IBAction func FasterTapping(_ sender: Any) {
        switch WaitTimeLvl {
        case 1:
            if CurrentMoney >= 10 {
                UpdateforFasterTapping()
                NextWaitTimeCost = 1000
                WaitTimeCostPrint = "1,000"
                self.FasterTappingCostLbl.text = WaitTimeCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 2:
            if CurrentMoney >= 1000 {
                UpdateforFasterTapping()
                NextWaitTimeCost = 100000
                WaitTimeCostPrint = "100,000"
                self.FasterTappingCostLbl.text = WaitTimeCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 3:
            if CurrentMoney >= 100000 {
                UpdateforFasterTapping()
                NextWaitTimeCost = 50000000
                WaitTimeCostPrint = "50M"
                self.FasterTappingCostLbl.text = WaitTimeCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 4:
            if CurrentMoney >= 50000000 {
                UpdateforFasterTapping()
                NextWaitTimeCost = 1000000000
                WaitTimeCostPrint = "1B"
                self.FasterTappingCostLbl.text = WaitTimeCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        case 5:
            if CurrentMoney >= 1000000000 {
                UpdateforFasterTapping()
                WaitTimeCostPrint = "N/A"
                self.FasterTappingCostLbl.text = WaitTimeCostPrint
                Dismiss()
            }
            else {
                Wait()
            }
        default:
            self.FasterTappingCostLbl.text = WaitTimeCostPrint
        }
    }

    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cheat(_ sender: Any) {
        CurrentMoney += 10000000000
        dismiss(animated: true, completion: nil)
    }
}
