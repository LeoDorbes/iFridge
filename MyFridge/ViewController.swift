//
//  ViewController.swift
//  MyFridge
//
//  Created by Alexia Longval on 02/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    let myNotification = Notification.Name(rawValue:"MyNotification")

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CourseItemListSingleton.instance.getCount()
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        promptForAnswer()
    }
    
    @IBAction func endBtnPressed(_ sender: Any) {
        print("fini")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.setEditing(true, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
        let nc = NotificationCenter.default // Note that default is now a property, not a method call
        nc.addObserver(forName:Notification.Name(rawValue:"MyNotification"),
                       object:nil, queue:nil) {
                        notification in
                        // Handle notification
        }
    }
    
    override func viewDidAppear(_ animated: Bool) { 
        super.viewDidAppear(animated)
        let nc = NotificationCenter.default
        nc.post(name:myNotification,
                object: nil,
                userInfo:["message":"Hello there!", "date":Date()])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("You selected cell number: \(indexPath.row)!")
        CourseItemListSingleton.instance.switchState(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        NSLog("You deselected cell number: \(indexPath.row)!")
        CourseItemListSingleton.instance.switchState(row: indexPath.row)
    }
    

    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
        
        guard let userInfo = notification.userInfo,
            let message  = userInfo["message"] as? String,
            let date     = userInfo["date"]    as? Date else {
                print("No userInfo found in notification")
                return
        }
        

        let alert = UIAlertController(title: "Notification!",
                                      message:"\(message) received at \(date)",
            preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellule", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = CourseItemListSingleton.instance.getElementAt(row: row).getName()
        if(CourseItemListSingleton.instance.isSelected(row: row)){
            self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let row = indexPath.row
            
            CourseItemListSingleton.instance.removeAt(row: row)
            //ItemListSingleton.list.itemList.getElements().remove(at: row)
            self.tableView.reloadData()
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Entrez l'article", message: nil, preferredStyle: .alert)
        ac.addTextField{(textfield : UITextField) -> Void in
            textfield.placeholder = "Nom"
        }
        
        let submitAction = UIAlertAction(title: "Ok", style: .default) { [unowned ac] _ in
            if let answer = ac.textFields![0].text
            {
            // do something interesting with "answer" here
                CourseItemListSingleton.instance.add(item : CourseItem(n: answer))
                //ItemListSingleton.list.itemList.getElements().append(answer)
                self.tableView.reloadData()
            }
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }

}

