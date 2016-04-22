//
//  ItemController.swift
//  ShoppingList
//
//  Created by Aaron Eliason on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData
class ItemController {
    static let sharedController = ItemController()
    //Crud
    
    var items: [Item] {
        let items = fetchAllItems()
        return items
    }
    
    //Create
    
    func createItem(name: String, isComplete: Bool) {
        let _ = Item(name: name, isComplete: false)
        saveItems()
    }
    
    //Retreive
    
    func fetchAllItems() -> [Item] {
        let request = NSFetchRequest(entityName: "Item")
        
        var items: [Item] = []
        
        do {
            items = (try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as? [Item]) ?? []
        } catch {
            print("There was an errory with fetching")
        }
        return items
    }
    
    // update/ save
    
    func saveItems() {
        let context = Stack.sharedStack.managedObjectContext
        do {
            let _ = try context.save()
        } catch {
            print("There was a problem with saving your items")
        }
    }
    
    
    // delete
    
    func deleteItems(item: Item) {
        item.managedObjectContext?.deleteObject(item)
        saveItems()
    }
    
    func updateItemSelection(item: Item, selected: Bool) {
        item.isComplete = selected
    }
}
