//
//  ViewController.swift
//  CSCoinCounter
//
//  Created by Sanjit Thangarasu on 1/15/20.
//  Copyright © 2020 Cloud Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UITextField!
    @IBOutlet weak var givenLabel: UITextField!
    @IBOutlet weak var changeLabel: UILabel!
    
    
    @IBOutlet weak var twentyLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var dimeLabel: UILabel!
    @IBOutlet weak var nickelLabel: UILabel!
    @IBOutlet weak var pennyLabel: UILabel!
    
    var change = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)*/
        
    }
    @IBAction func calculateChange(_ sender: AnyObject) {
        let total: Double? = Double(totalLabel.text!)
        let given: Double? = Double(givenLabel.text!)
        let totalCoin = total!*100.0
        let givenCoin = given!*100.0
        var change = (givenCoin - totalCoin)/100.0
        change = round(100.0 * change) / 100.0
        changeLabel.text = "$ " + String(change)
        
        print("before calcNumChange")
        calcNumChange(change: change)
        print("after calcNumChange")
    }
    
    func calcNumChange(change: Double) {
        print("entered calcNumChange")
        
        twentyLabel.text = ""
        tenLabel.text = ""
        fiveLabel.text = ""
        oneLabel.text = ""
        quarterLabel.text = ""
        nickelLabel.text = ""
        dimeLabel.text = ""
        pennyLabel.text = ""
        /*
        let twenty  = 2000
        let ten     = 1000
        let five    = 500
        let one     = 100
        let quarter = 25
        let dime    = 10
        let nickel  = 5
        let penny   = 1
        
        var twentyCount  = 0
        var tenCount     = 0
        var fiveCount    = 0
        var oneCount     = 0
        var quarterCount = 0
        var dimeCount    = 0
        var nickelCount  = 0
        var pennyCount   = 0
        
        
        var (q, r) = (0, 0)
        var coinChange = Int(change*100)
        */
        //x.quotientAndRemainder(dividingBy: 933)
        
        var coinChange = Int(change*100)
        let worddenominations = ["penny", "nickel", "dime", "quarter", "one", "five", "ten", "twenty"]
        let denominations = [1, 5, 10, 25, 100, 500, 1000, 2000]
        let length = denominations.count
        
        var finalDenoms = ["penny":0, "nickel":0, "dime":0, "quarter":0, "one":0, "five":0, "ten":0, "twenty":0]
        
       // var ans = [Int]()
        var i = length-1
        
        while(i >= 0) {
            while (coinChange >= denominations[i]) {
                coinChange -= denominations[i]
                finalDenoms[worddenominations[i]]! += 1
            }
            i -= 1
        }
        
        if let twentyString = finalDenoms["twenty"] {
            twentyLabel.text
                
                = String(twentyString)
        }
        if let tenString = finalDenoms["ten"] {
            tenLabel.text = String(tenString)
        }
        if let fiveString = finalDenoms["five"] {
            fiveLabel.text = String(fiveString)
        }
        if let oneString = finalDenoms["one"] {
            oneLabel.text = String(oneString)
        }
        if let quarterString = finalDenoms["quarter"] {
            quarterLabel.text = String(quarterString)
        }
        if let nickelString = finalDenoms["nickel"] {
            nickelLabel.text = String(nickelString)
        }
        if let dimeString = finalDenoms["dime"] {
            dimeLabel.text = String(dimeString)
        }
        if let pennyString = finalDenoms["penny"] {
            pennyLabel.text = String(pennyString)
        }
        
        
        
        /*
        if (coinChange < twenty) {
            if (coinChange < ten) {
                if (coinChange < five) {
                    if (coinChange < one) {
                        if (coinChange < quarter) {
                            if (coinChange < dime) {
                                if (coinChange < nickel) {
                                    if (coinChange < penny) {
                                        pennyCount += coinChange
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                r.quotientAndRemainder(dividingBy: ten)
                tenCount += q
            }
            coinChange.quotientAndRemainder(dividingBy: twenty)
            twentyCount += q
        }
        
        func twentyChangeCount(change: Int) -> Int {
            if (change < twenty) {
                return 0
            }
            
        }*/
        
        
        
        
        
        
        /*
        func twentyChangeCount(change: Int) -> Int{
            if (change < twenty) {
                tenChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: twenty)
            twentyCount += q
            print("$20: \(twentyCount)")
            twentyLabel.text = String(twentyCount)
            return twentyCount
        }
        func tenChangeCount(change: Int){
            if (change < ten) {
                fiveChangeCout(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: ten)
            tenCount += q
            print("$10: \(tenCount)")
            tenLabel.text = String(tenCount)
            fiveChangeCount(change: r)
        }
        func fiveChangeCount(change: Int){
            if (change < five) {
                oneChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: five)
            fiveCount += q
            print("$5: \(fiveCount)")
            fiveLabel.text = String(fiveCount)
            oneChangeCount(change: r)
        }
        func oneChangeCount(change: Int){
            if (change < one) {
                quarterChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: one)
            oneCount += q
            print("$1: \(oneCount)")
            oneLabel.text = String(oneCount)
            quarterChangeCount(change: r)
        }
        func quarterChangeCount(change: Int){
            if (change < quarter) {
                dimeChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: quarter)
            quarterCount += q
            print("¢25: \(quarterCount)")
            quarterLabel.text = String(quarterCount)
            dimeChangeCount(change: r)
        }
        func dimeChangeCount(change: Int){
            if (change < dime) {
                nickelChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: dime)
            dimeCount += q
            print("¢10: \(dimeCount)")
            dimeLabel.text = String(dimeCount)
            nickelChangeCount(change: r)
        }
        func nickelChangeCount(change: Int){
            if (change < nickel) {
                pennyChangeCount(change: change)
            }
            (q, r) = change.quotientAndRemainder(dividingBy: nickel)
            nickelCount += q
            print("¢5: \(nickelCount)")
            nickelLabel.text = String(nickelCount)
            pennyChangeCount(change: r)
        }
        func pennyChangeCount(change: Int){
            pennyCount += change
            print("¢1: \(pennyCount)")
            pennyLabel.text = String(pennyCount)
        }
        twentyChangeCount(change: coinChange) */
    }
    
}

