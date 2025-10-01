//
//  Viper_SwiftUI_CoreDataTests.swift
//  Viper_SwiftUI_CoreDataTests
//
//  Created by Igor Polousov on 22.11.2024.
//

import XCTest
@testable import Viper_SwiftUI_CoreData

// What to test: httpDataDownloader, taskClient, core data stack, task provider

final class Viper_SwiftUI_CoreDataTests: XCTestCase {
    
    
    // Тестирование HTTPDownloader + Client
    func testClientDoesFetchTodosData() async throws {
        let downLoader = TestDownloader()
        let client = TasksClient(downLoader: downLoader)
        let tasks = try await client.tasks
        XCTAssertEqual(tasks.count, 6)
    }
    
    // Тестирование Todos + Todo
    func testTodosDecoderDecodesTodoJson() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Todos.self, from: testTodosData)
        
        XCTAssertEqual(decoded.todos.count, 6)
        XCTAssertEqual(decoded.todos[0].userId, 152)
        XCTAssertEqual(decoded.todos[0].id, 1)
        XCTAssertEqual(decoded.todos[0].completed, false)
    }
    
    // Тестирование TaskProvider
    func testProviderCreateNewTask() throws {
        let provider = TasksProvider()
        let taskModel_1 = TaskModel()
        provider.tasks.append(taskModel_1)
        provider.updateTask(at: 0, taskName: "New Name", taskDescription: "New Description")
        
        XCTAssertEqual(provider.tasks[0].taskName, "New Name")
        XCTAssertEqual(provider.tasks[0].description, "New Description")
    
    }
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
