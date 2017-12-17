//
//  CommandExecutorTests.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import XCTest
@testable import CommandsCore

class CommandExecutorTests: XCTestCase {

    func testCommandExecutorExecutesCommandWithArguments() {
        let command = Command(launchPath: "/bin/echo", arguments: ["hello world"])
        let commandExecutor = CommandExecutor(command: command)
        XCTAssertNoThrow(commandExecutor.execute())
    }

    func testCommandExecutorExecutesCommand() {
        let command = Command(launchPath: "/bin/echo")
        let commandExecutor = CommandExecutor(command: command)
        XCTAssertNoThrow(commandExecutor.execute())
    }
}

