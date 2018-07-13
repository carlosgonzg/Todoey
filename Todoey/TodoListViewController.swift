//
//  ViewController.swift
//  Todoey
//
//  Created by Carlos Gonzalez on 7/13/18.
//  Copyright © 2018 Carlos Gonzalez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray : [String] = ["Kill", "Myself", "Lol...?"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}
