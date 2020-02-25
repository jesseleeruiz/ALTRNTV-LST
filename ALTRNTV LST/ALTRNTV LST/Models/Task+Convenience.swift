//
//  Task+Convenience.swift
//  ALTRNTV LST
//
//  Created by Jesse Ruiz on 2/25/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult convenience init(task: String,
                                        timestamp: Date = Date(),
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        
        self.task = task
        self.timestamp = timestamp
    }
    
    @discardableResult convenience init?(taskRepresentation: TaskRepresentation,
                                         context: NSManagedObjectContext) {
        
        guard let task = taskRepresentation.task,
            let timestamp = taskRepresentation.timestamp else { return nil }
        
        self.init(task: task, timestamp: timestamp, context: context)
    }
    
    var taskRepresentation: TaskRepresentation {
        return TaskRepresentation(task: task, timestamp: timestamp)
    }
}
