//
//  ToDoListViewController.swift
//  TodoListByAngelaYu
//
//  Created by Kumaran on 11/08/23.
//

import UIKit

class ToDoListViewController: UITableViewController{
    
    let namesArray = ["Shiva", "Kumar", "PGK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addNewListButtonTapped(_ sender: UIBarButtonItem) {
        
        var text = ""
        
        let alertController = UIAlertController(title: "ToDoList", message: "Add New List", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success: ", text)
        }
        
        alertController.addTextField { (textFeild) in
            textFeild.placeholder = "Enter List Here"
            text = textFeild.text ?? ""
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

extension ToDoListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(namesArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
