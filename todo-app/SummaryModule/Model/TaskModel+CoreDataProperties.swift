//
//  TaskModel+CoreDataProperties.swift
//  todo-app
//
//  Created by polykuzin on 29/08/2022.
//
//

import CoreData

extension TaskModel {
    
    @NSManaged public var id : UUID
    @NSManaged public var title : String
    @NSManaged public var isCompleted : Bool
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }
}

extension TaskModel : Identifiable { }
