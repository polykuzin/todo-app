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
    
    @Published
    public var items: [TaskModel] = []
    
    public init() {
        getItems()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getItems() {
        self.items = TaskModelContainer.shared.fetch()
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
//        CoreDataManager(modelName: "TaskModel").managedObjectContext.delete(items[Int(indexSet)])
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        TaskModelContainer.shared.createTask(title: title)
        self.getItems()
    }
    
    func updateItem(item: TaskModel) {
        item.isCompleted.toggle()
        do {
            try context.save()
        }
        catch {
            fatalError("❌ Failed to update Task: \(error.localizedDescription)")
        }
    }
    
    func saveItems() {
//        if let encodedData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
    }
}
