//
//  ToDoListViewController.swift
//  TodoListByAngelaYu
//
//  Created by Kumaran on 11/08/23.
//

import UIKit

class ToDoListViewController: UITableViewController{
    
    //    var itemsListArray = ["Shiva", "Kumar", "PGK"]
    var itemsListArray = [Item]()
    let defaults = UserDefaults()
    //    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        //        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
        //            itemsListArray = items
        //        }
    }
    
    func getData() {
        let item = Item(title: "Shiva")
        itemsListArray.append(item)
        let item1 = Item(title: "Kumar")
        itemsListArray.append(item1)
        let item2 = Item(title: "PGK")
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
        itemsListArray.append(item2)
    }
    
    @IBAction func addNewListButtonTapped(_ sender: UIBarButtonItem) {
        
        var itemTextField = UITextField()
        
        let alertController = UIAlertController(title: "To Do List", message: "Add New List Below", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { [weak self] (action) in
            guard let textString = itemTextField.text else { return }
            let item = Item(title: textString)
            self?.itemsListArray.append(item)
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
        cell.textLabel?.text = itemsListArray[indexPath.row].title
        
//        if itemsListArray[indexPath.row].isSelected == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//        cell.accessoryType = itemsListArray[indexPath.row].isSelected == true ? .checkmark : .none
        cell.accessoryType = itemsListArray[indexPath.row].isSelected ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print(namesArray[indexPath.row])
        //        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        //            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        //        } else {
        //            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //        }
        //        if itemsListArray[indexPath.row].isSelected == false {
        //            itemsListArray[indexPath.row].isSelected = true
        //        } else {
        //            itemsListArray[indexPath.row].isSelected = false
        //        }
        itemsListArray[indexPath.row].isSelected = !itemsListArray[indexPath.row].isSelected
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
