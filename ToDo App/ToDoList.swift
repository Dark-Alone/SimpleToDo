//
//  ToDoList.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI

struct ToDoList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: ToDoItem.entity(),
        sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true), NSSortDescriptor(key: "isCompleted", ascending: true)],
        animation: .default
    )
    var todos: FetchedResults<ToDoItem>
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                ToDoView(todo: todo)
                    .swipeActions {
                        Button {
                            moc.delete(todo)
                        } label: {
                            Text("Delete")
                        }
                        .tint(.red)
                    }
            }
        }
    }
}

#Preview {
    ToDoList()
}
