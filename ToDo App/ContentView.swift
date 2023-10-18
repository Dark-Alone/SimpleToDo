//
//  ContentView.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationView {
            ToDoList()
                .overlay(alignment: .bottomTrailing) {
                    Button(action: {
                        let todo = ToDoItem(context: managedObjectContext)
                        todo.title = "new todo"
                        todo.dateCreated = Date()
                        todo.isCompleted = false
                    }, label: {
                        Text("+")
                            .font(.system(size: 24))
                            .bold()
                            .frame(width: 40, height: 40)
                            .background(Color(white: 0.3), in: Circle())
                            .padding()
                    })
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController(inMemory: true).container.viewContext)
}
