//
//  ToDoList.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI

struct ToDoList: View {
    @FetchRequest(
        entity: ToDoItem.entity(),
        sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true), NSSortDescriptor(key: "isCompleted", ascending: true)]
    )
    var todos: FetchedResults<ToDoItem>
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                Text(todo.titleWrapped)
            }
        }
    }
}

#Preview {
    ToDoList()
}
