//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by Michael Duong on 1/26/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    convenience init(name: String, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.isComplete = false
    }
}
