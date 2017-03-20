//
//  DetailsViewController.swift
//  MyFridge
//
//  Created by Alex Hawk on 13/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var rowIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = FridgeItemListSingleton.instance.getElementAt(row: rowIndex).getName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func okBtn(_ sender: Any) {
        let date = datePicker.date
        FridgeItemListSingleton.instance.getElementAt(row: rowIndex).setDate(d: date)
        _ = navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
