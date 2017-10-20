//
//  CommandExecutorTests.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import XCTest
@testable import CommandsCore

class CommandExecutorTests: XCTestCase {

    func testCommandExecutorExecutes() {
        let commandExecutor = CommandExecutor()
        XCTAssertNoThrow(commandExecutor.executeCommand(at: "/bin/echo", arguments: ["hello world"]))
    }

    func testCommandExecutorArgumentCount() {
        class MockCommandExecutor: CommandExecutor {
            var argumentsCount = -1
            override func executeCommand(at launchPath: String, arguments: [String] = []) {
                argumentsCount = arguments.count
            }
        }

        let mock = MockCommandExecutor()
        mock.executeCommand(at: "🐶🐮")
        XCTAssertEqual(mock.argumentsCount, 0)

        mock.executeCommand(at: "🐶🐮", arguments: ["🐷", "🐑", "🐓"])
        XCTAssertEqual(mock.argumentsCount, 3)
    }
}

