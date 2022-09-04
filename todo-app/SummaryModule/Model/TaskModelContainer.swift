//
//  TaskContainer.swift
//  todo-app
//
//  Created by polykuzin on 29/08/2022.
//

import SwiftUI
import CoreData

class TaskModelContainer {
    
    public static let shared = TaskModelContainer()
    
    private var context : NSManagedObjectContext = {
        guard
            let delegate = UIApplication.shared.delegate as? AppDelegate
        else { fatalError() }
        return delegate.persistentContainer.viewContext
    }()
    
    public func createTask(title: String) {
        guard
            let task = NSEntityDescription.insertNewObject(forEntityName: "TaskModel", into: context) as? TaskModel
        else { fatalError() }
        
        task.id = UUID()
        task.title = title
        task.isCompleted = false
        
        do {
            try context.save()
            print("✅✅✅ Task saved succesfuly: \(task)")
        } catch let error {
            print("❌❌❌ Failed to create Task: \(error.localizedDescription)")
        }
    }
}
