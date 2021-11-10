//
//  ViewController.swift
//  TaxApp
//
//  Created by masataka maekawa on 2021/11/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLog.delegate = self
        priceLog.dataSource = self

        costsArray.removeAll()
    }
    

    var cost:Double = 0
    var addTaxCost:Double = 0
    var costsArray:[Double] = []
    var addTaxCostString:String = ""
    
    @IBOutlet weak var calcLabel: UILabel!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var taxChange: UISegmentedControl!
    @IBOutlet weak var priceLog: UITableView!
    
    @IBAction func taxController(_ sender: Any) {
        if taxChange.selectedSegmentIndex == 0 {
            calc(tax: 1.1)
        } else {
            calc(tax: 1.08)
        }
    }
    
    func calc(tax:Double) {
         cost = Double(costField.text!)!
         addTaxCost = cost * Double(tax)
         addTaxCostString = String(format: "%.0f", addTaxCost)
         calcLabel.text = addTaxCostString
     }
    
    @IBAction func additionButton(_ sender: Any) {
        costsArray.append(contentsOf: [addTaxCost])
        UserDefaults.standard.set(costsArray, forKey: "item")

        costField.text = ""
        calcLabel.text = ""

        self.priceLog.reloadData()
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = priceLog.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(costsArray[indexPath.row])"

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

                costsArray.remove(at: indexPath.row)

                UserDefaults.standard.set(costsArray, forKey: "item")

               priceLog.reloadData()
        }
    }
}

