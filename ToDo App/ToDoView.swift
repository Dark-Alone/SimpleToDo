//
//  ToDoView.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI

struct ToDoView: View {
    let todo: ToDoItem
    
    var body: some View {
        Text(todo.titleWrapped)
    }
}

#Preview {
    List {
        ToDoView(todo: ToDoItem.preview)
            .environment(\.managedObjectContext, PersistenceController.preview.viewContext)
    }
}
