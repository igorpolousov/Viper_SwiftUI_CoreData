//
//  TaskModel+CoreDataProperties.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 28.09.2025.
//
//

public import Foundation
public import CoreData


public typealias TaskModelCoreDataPropertiesSet = NSSet

extension TaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var id: UUID
    @NSManaged public var taskName: String
    @NSManaged public var taskDescription: String
    @NSManaged public var taskDate: Date
    @NSManaged public var isCompleted: Bool

}

extension TaskModel : Identifiable {

}
