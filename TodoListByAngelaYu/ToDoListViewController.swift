//
//  ToDoListViewController.swift
//  TodoListByAngelaYu
//
//  Created by Kumaran on 11/08/23.
//

import UIKit

class ToDoListViewController: UITableViewController{
    
    var itemsListArray = ["Shiva", "Kumar", "PGK"]
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemsListArray = items		
        }
    }
    
    @IBAction func addNewListButtonTapped(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let alertController = UIAlertController(title: "To Do List", message: "Add New List Below", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { [weak self] (action) in
            guard let textString = itemTextField.text else { return }
            self?.itemsListArray.append(textString)
            self?.defaults.set(self?.itemsListArray, forKey: "ToDoListArray")
            self?.tableView.reloadData()
        }
        
        alertController.addTextField { (textFeild) in
            textFeild.placeholder = "Enter List Here"
            itemTextField = textFeild
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
        return itemsListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemsListArray[indexPath.row]
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
