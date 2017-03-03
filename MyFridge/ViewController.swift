//
//  ViewController.swift
//  MyFridge
//
//  Created by Alexia Longval on 02/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var liste : [ String ] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        promptForAnswer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        print(liste.count)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellule", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = liste[row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Entrez le nom de l'article", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Ok", style: .default) { [unowned ac] _ in
            if let answer = ac.textFields![0].text
            {
            // do something interesting with "answer" here
                self.liste.append(answer)
                self.tableView.reloadData()
            }
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }

}

