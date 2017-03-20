//
//  FridgeViewControllerTableViewController.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDate: UILabel!
    
}
class FridgeViewController: UITableViewController {
    
    //label
    @IBOutlet weak var lbl: UILabel!

    @IBAction func stepper(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FridgeItemListSingleton.instance.getCount()
    }
    
    func AddCourseList() {

        
        //FridgeItemListSingleton.instance.add(item : CourseItem(n: answer))
        //self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellule", for: indexPath) as! FruitTableViewCell
        let row = indexPath.row
        let fridgeItem = FridgeItemListSingleton.instance.getElementAt(row: row)
        cell.productName?.text = fridgeItem.getName()
        if(fridgeItem.isSet()){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy"
            cell.productDate?.text =  dateFormatter.string(from: fridgeItem.getDate())
        } else{
            cell.productDate?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let row = indexPath.row
            FridgeItemListSingleton.instance.removeAt(row: row)
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "DetailSegue"){
            if let detail =  segue.destination as? DetailsViewController,
                let index = tableView.indexPathForSelectedRow?.row
            {
                detail.rowIndex = index
            }
        }
        //tableView.indexPathForSelectedRow
        
        
        
    
    }
}
