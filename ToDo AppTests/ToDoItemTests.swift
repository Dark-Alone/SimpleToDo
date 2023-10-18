//
//  ToDoItemTests.swift
//  ToDo AppTests
//
//  Created by Марк Акиваев on 10/18/23.
//

import XCTest
@testable import ToDo_App

final class ToDoItemTests: XCTestCase {

    func test_titleWrapped() {
        let persistent = PersistenceController(inMemory: true)
        let context = persistent.viewContext
        let item = ToDoItem(context: context)
        
        let title = "ToDo App development"
        
        item.title = title
        
        XCTAssertEqual(item.titleWrapped, title)
    }
}
