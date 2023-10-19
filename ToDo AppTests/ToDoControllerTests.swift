//
//  ToDoControllerTests.swift
//  ToDo AppTests
//
//  Created by Марк Акиваев on 10/19/23.
//

import XCTest
@testable import ToDo_App

final class ToDoControllerTests: XCTestCaseWithFakePersistence {
    
    func test_createTodo() {
        let todoController = ToDoController()
        
        todoController.createTodo(moc: context)
        
        XCTAssertNotNil(todoController.editingID)
        XCTAssertTrue(context.hasChanges)
    }
    
    func test_resetEditing() {
        let someObject = ToDoItem(context: context)
        let todoController = ToDoController()
        
        todoController.editingID = someObject.id
        XCTAssertNotNil(todoController.editingID)
        todoController.resetEditing()
        
        XCTAssertNil(todoController.editingID)
    }
}
