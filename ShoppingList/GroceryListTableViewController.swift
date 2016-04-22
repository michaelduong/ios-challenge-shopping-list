//
//  GroceryListTableViewController.swift
//  ShoppingList
//
//  Created by Aaron Eliason on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class GroceryListTableViewController: UITableViewController, ItemTableViewCellDelegate {
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        self.items = ItemController.sharedController.items

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @IBAction func addItemButtonTapped(sender: AnyObject) {
        var itemTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add to list", message: "Add your items below", preferredStyle: .Alert)
        let create = UIAlertAction(title: "Create", style: .Default) { (_) in
            if let itemTextField = itemTextField,
                title = itemTextField.text {
                ItemController.sharedController.createItem(title, isComplete: false)
                self.items = ItemController.sharedController.items
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            itemTextField = textField
            alertController.addAction(create)
            alertController.addAction(cancelAction)
            itemTextField = textField
            itemTextField?.placeholder = "Hey James! ;)"
        }
        presentViewController(alertController, animated: true, completion:  nil)
        
        
        
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCellWithIdentifier("itemCell") as? ListTableViewCell {
        
        let item = self.items[indexPath.row]
        cell.updateWithItem(item)
        cell.delegate = self
        cell.textLabel?.text = item.name
        return cell
    }
        return UITableViewCell()
}
    
    
    func ItemValueChangedCell(cell: ListTableViewCell, selected: Bool) {
        guard let item = cell.item else {return}
        ItemController.sharedController.updateItemSelection(item, selected: selected)
        tableView.reloadData()
    }

    
}



























