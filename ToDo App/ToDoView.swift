//
//  ToDoView.swift
//  ToDo App
//
//  Created by Марк Акиваев on 10/18/23.
//

import SwiftUI

struct ToDoView: View {
    @EnvironmentObject var todoController: ToDoController
    @ObservedObject var todo: ToDoItem
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            completionStatus
            
            textStatus
        }
        .frame(height: 35)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.listBackground)
        .onTapGesture {
            todo.completed()
        }
        .onLongPressGesture {
            isFocused.toggle()
            todoController.editingID = todo.id
        }
    }
    
    var completionStatus: some View {
        RoundedRectangle(cornerRadius: 7)
            .fill(todo.isCompleted ? Color(red: 0.1, green: 0.1, blue: 1) : .clear)
            .overlay {
                RoundedRectangle(cornerRadius: 7)
                    .stroke()
            }
            .overlay {
                if todo.isCompleted {
                    Image(systemName: "checkmark")
                        .font(.body.weight(.medium))
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 20, height: 20)
    }
    
    @ViewBuilder
    var textStatus: some View {
        if todoController.editingID == todo.id {
            TextField(text: $todo.title.toUnwrapped(defaultValue: "")) {
                Text("Enter next todo")
            }
            .focused($isFocused)
            .onAppear {
                isFocused = true
            }
            .onSubmit {
                todoController.resetEditing()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Save") {
                        todoController.resetEditing()
                        isFocused = false
                    }
                }
            }
        } else if todo.titleWrapped.isEmpty {
            Text("Empty ToDo")
                .foregroundStyle(.gray)
        } else {
            Text(todo.titleWrapped)
        }
    }
}
