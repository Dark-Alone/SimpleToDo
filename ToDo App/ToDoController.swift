//
//  ToDoController.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/19/23.
//

import Foundation
import CoreData

class ToDoController: ObservableObject {
    @Published var editingID: ObjectIdentifier?
    
    func createTodo(moc: NSManagedObjectContext) {
        let item = ToDoItem(
            viewContext: moc
        )
        
        editingID = item.id
    }
    
    func resetEditing() {
        editingID = nil
    }
}
