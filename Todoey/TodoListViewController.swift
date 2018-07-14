//
//  ViewController.swift
//  Todoey
//
//  Created by Carlos Gonzalez on 7/13/18.
//  Copyright © 2018 Carlos Gonzalez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray : [String] = ["Kill", "Myself", "Lol...?"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemArray = defaults.value(forKey: "ToDoListArray") as? [String] ?? ["Kill", "Myself", "Lol...?"]
    }
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    //MARK - Tableview Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        //check item
        tableView.cellForRow(at: indexPath)?.accessoryType = (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ? .none : .checkmark)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK - Button stuff
    @IBAction func btnAddToList(_ sender: UIBarButtonItem) {
        var itemTextField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        //adding action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let itemText = itemTextField.text {
                print(itemText)
                self.itemArray.append(itemText)
                
                self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
                self.tableView.reloadData()
            }
        }
        alert.addAction(action)
        //text field
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            itemTextField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
}
