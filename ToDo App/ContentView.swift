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
                        let _ = ToDoItem(
                            title: "new todo",
                            viewContext: managedObjectContext
                        )
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.blue, in: Circle())
                            .padding()
                    })
                }
                .navigationTitle("Simple ToDo")
        }
    }
}
