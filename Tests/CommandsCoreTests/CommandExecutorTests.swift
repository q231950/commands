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
}

