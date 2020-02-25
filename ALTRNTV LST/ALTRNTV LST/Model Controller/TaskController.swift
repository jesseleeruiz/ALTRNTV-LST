//
//  TaskController.swift
//  ALTRNTV LST
//
//  Created by Jesse Ruiz on 2/25/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CoreData

class taskController {
    
    func createTask(with task: String) {
        Task(task: task)
        
        CoreDataStack.shared.save()
    }
    
    func updateTask(with task: Task, text: String) {
        task.task = text
        task.timestamp = Date()
        
        CoreDataStack.shared.save()
    }
    
    func deleteTask(with task: Task) {
        CoreDataStack.shared.mainContext.delete(task)
        CoreDataStack.shared.save()
    }
}
