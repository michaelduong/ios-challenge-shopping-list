//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Michael Duong on 1/26/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController, ListTableViewCellDelegate {
    
    func buttonCellTapped(_sender: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: _sender) else { return }
        let item = ItemController.shared.items[indexPath.row]
        ItemController.shared.toggleIsComplete(item: item)
        tableView.reloadData()
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        var itemTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add to Shopping List", message: "Add your item", preferredStyle: .alert)
        
        let create = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let itemTextField = itemTextField, let item = itemTextField.text else { return }
            ItemController.shared.add(name: item)
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Add some items to the list"
            itemTextField = textField
            alertController.addAction(create)
            alertController.addAction(cancel)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListTableViewCell
        let item = ItemController.shared.items[indexPath.row]
        cell?.update(withItem: item)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = ItemController.shared.items[indexPath.row]
            ItemController.shared.delete(item: item)
            tableView.reloadData()
        }
    }
}
