//
//  File.swift
//  ToDo AppTests
//
//  Created by Марк Акиваев on 10/19/23.
//

import XCTest
@testable import ToDo_App
import CoreData

class XCTestCaseWithFakePersistence: XCTestCase {
    var persistenceController: PersistenceController!
    
    var context: NSManagedObjectContext {
        persistenceController.viewContext
    }
    
    override func setUp() {
        super.setUp()
        persistenceController = PersistenceController(inMemory: true)
    }
    
    override func tearDown() {
        super.tearDown()
        persistenceController = nil
    }
}
