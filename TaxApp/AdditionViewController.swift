//
//  AdditionViewController.swift
//  TaxApp
//
//  Created by masataka maekawa on 2021/11/09.
//

import UIKit

class AdditionViewController: UIViewController {
    
    var resultArray:[Double] = []
    var sum:Double = 0
    
    @IBAction func retuenButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var additionView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultArray = UserDefaults.standard.object(forKey: "item") as! [Double]
        sum = resultArray.reduce(0) { (num1:Double, num2:Double) -> Double in
            return num1 + num2
        }
        
        additionView.text = String(format: "%.0f", sum)
    }
    
}
