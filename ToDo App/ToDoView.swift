//
//  ToDoView.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI

struct ToDoView: View {
    @ObservedObject var todo: ToDoItem
    
    var body: some View {
        HStack {
            completionStatus
            
            Text(todo.titleWrapped)
        }
        .frame(height: 35)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .onTapGesture {
            todo.isCompleted.toggle()
            PersistenceController.shared.save()
        }
    }
    
    var completionStatus: some View {
        RoundedRectangle(cornerRadius: 7)
            .fill(todo.isCompleted ? Color(red: 0.3, green: 0.3, blue: 1) : .clear)
            .overlay {
                RoundedRectangle(cornerRadius: 7)
                    .stroke()
            }
            .overlay {
                if todo.isCompleted {
                    Image(systemName: "checkmark")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 20, height: 20)
    }
}

#Preview {
    List {
        ToDoView(todo: ToDoItem.preview)
            .environment(\.managedObjectContext, PersistenceController.preview.viewContext)
    }
}
