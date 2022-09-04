//
//  SummaryViewModel.swift
//  todo-app
//
//  Created by polykuzin on 26/08/2022.
//
// swiftlint:disable all

import SwiftUI
import CoreData

class SummaryViewModel : ObservableObject {
    
    public init() {
        items = getItems()
    }
    
    @Published
    public var items = [TaskModel]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getItems() -> [TaskModel] {
        let fetchRequest = NSFetchRequest<TaskModel>(entityName: "TaskModel")
        do {
            return try context.fetch(fetchRequest)
        } catch {
            fatalError("❌❌❌ Failed to fetch Task: \(error)")
        }
    }
    
    func deleteItem(_ item: TaskModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            do {
                let item = items[index]
                items.remove(at: index)
                context.delete(item)
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        TaskModelContainer.shared.createTask(title: title)
        items = getItems()
    }
    
    func updateItem(item: TaskModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            do {
                guard
                    let task = NSEntityDescription.insertNewObject(forEntityName: "TaskModel", into: context) as? TaskModel
                else { fatalError() }
                
                task.id = items[index].id
                task.title = items[index].title
                task.isCompleted = !items[index].isCompleted
                let item = items[index]
                items.remove(at: index)
                context.delete(item)
                items.insert(task, at: index)
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func saveItems() {
        do {
            try context.save()
        }
        catch {
            fatalError("❌ Failed to update Task: \(error.localizedDescription)")
        }
    }
}
