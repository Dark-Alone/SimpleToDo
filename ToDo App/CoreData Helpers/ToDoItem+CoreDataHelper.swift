//
//  ToDoItem+CoreDataHelper.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import Foundation
import CoreData

extension ToDoItem {
    convenience init(
        title: String? = nil,
        dateCreated: Date = Date(),
        isCompleted: Bool = false,
        viewContext: NSManagedObjectContext
    ) {
        self.init(context: viewContext)
        self.title = title
        self.dateCreated = dateCreated
        self.isCompleted = isCompleted
    }
    
    var titleWrapped: String {
        title ?? "Empty ToDo"
    }
}
