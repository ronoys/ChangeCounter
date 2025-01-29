//
//  ViewController.swift
//  CoinCounter
//
//  Created by Sanjit Thangarasu on 1/15/20.
//  Copyright © 2020 Cloud Systems. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var money: UILabel!
    
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func oneDollar(_ sender: Any) {
        total += 1
        money.text = String(total)
    }
    
    @IBAction func fiveDollar(_ sender: Any) {
        total += 5
        money.text = String(total)
    }
    
    @IBAction func tenDollar(_ sender: Any) {
        total += 10
        money.text = String(total)
    }

    @IBAction func twentyDollar(_ sender: Any) {
        total += 20
        money.text = String(total)
    }
    
    

}

