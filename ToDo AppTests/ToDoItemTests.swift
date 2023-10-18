//
//  ToDoItemTests.swift
//  ToDo AppTests
//
//  Created by Марк Акиваев on 10/18/23.
//

import XCTest
@testable import ToDo_App

final class ToDoItemTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUp() {
        super.setUp()
        persistenceController = PersistenceController(inMemory: true)
    }
    
    override func tearDown() {
        super.tearDown()
        persistenceController = nil
    }
    
    func test_convenienceInit() {
        let title = "Custom"
        let dateCreated = Date().addingTimeInterval(20 * 60)
        let isCompleted = true
        
        let item = ToDoItem(
            title: "Custom",
            dateCreated: dateCreated,
            isCompleted: isCompleted,
            viewContext: persistenceController.viewContext
        )
        
        XCTAssertEqual(item.title, title)
        XCTAssertEqual(item.dateCreated, dateCreated)
        XCTAssertEqual(item.isCompleted, isCompleted)
    }

    func test_titleWrapped() {
        let item = ToDoItem(context: persistenceController.viewContext)
        let title = "ToDo App development"
        
        item.title = title
        
        XCTAssertEqual(item.titleWrapped, title)
    }
}
