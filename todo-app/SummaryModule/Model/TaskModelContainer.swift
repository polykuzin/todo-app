//
//  TaskContainer.swift
//  todo-app
//
//  Created by polykuzin on 29/08/2022.
//
// swiftlint:disable all

import SwiftUI
import CoreData

//final class CoreDataManager {
//
//    public init(modelName: String) {
//        self.modelName = modelName
//    }
//
//    private let modelName: String
//
//    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
//        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
//
//        return managedObjectContext
//    }()
//    
//    private lazy var managedObjectModel: NSManagedObjectModel = {
//        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
//            fatalError("Unable to Find Data Model")
//        }
//
//        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
//            fatalError("Unable to Load Data Model")
//        }
//
//        return managedObjectModel
//    }()
//    
//    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//
//        let fileManager = FileManager.default
//        let storeName = "\(self.modelName).sqlite"
//
//        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
//
//        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
//
//        do {
//            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
//                                                              configurationName: nil,
//                                                              at: persistentStoreURL,
//                                                              options: nil)
//        } catch {
//            fatalError("Unable to Load Persistent Store")
//        }
//
//        return persistentStoreCoordinator
//    }()
//}

class TaskModelContainer {
    
    public static let shared = TaskModelContainer()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
