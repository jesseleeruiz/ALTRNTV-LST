//
//  CoreDataStack.swift
//  ALTRNTV LST
//
//  Created by Jesse Ruiz on 2/25/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        context.performAndWait {
            do {
                try context.save()
            } catch {
                NSLog("Unable to save context: \(error)")
                context.reset()
            }
        }
    }
    
    static let shared = CoreDataStack()
    
    let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ALTRNTV LST" as String)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext { return container.viewContext }
}
