//
//  ViewController.swift
//  MyFridge
//
//  Created by Alexia Longval on 02/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemListSingleton.instance.getCount()
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        promptForAnswer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellule", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = ItemListSingleton.instance.getElementAt(row: row).getName()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let row = indexPath.row
            
            ItemListSingleton.instance.removeAt(row: row)
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
                ItemListSingleton.instance.add(item : ItemList(n: answer))
                //ItemListSingleton.list.itemList.getElements().append(answer)
                self.tableView.reloadData()
            }
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }

}

