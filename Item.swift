//
//  Item.swift
//  ShoppingList
//
//  Created by Aaron Eliason on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Item: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init?(name: String, isComplete: Bool, context : NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
       guard let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context) else {return nil}
        
        self.init(entity : entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.isComplete = false
    }

}
