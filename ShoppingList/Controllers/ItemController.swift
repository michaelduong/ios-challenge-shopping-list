//
//  ItemController.swift
//  ShoppingList
//
//  Created by Michael Duong on 1/26/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    static let shared = ItemController()
    
    var items: [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let array = (try? CoreDataStack.context.fetch(request)) ?? []
        return array
    }
    
    func add(name: String) {
        let item = Item(name: name, isComplete: false)
        saveToPersistentStore()
    }
    
    func update(item: Item, name: String) {
        item.name = name
        saveToPersistentStore()
    }
    
    func delete(item: Item) {
        item.managedObjectContext?.delete(item)
        saveToPersistentStore()
    }
    
    func toggleIsComplete(item: Item) {
        item.isComplete = !item.isComplete
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("There was an problem saving: \(error.localizedDescription)")
        }
    }
}
