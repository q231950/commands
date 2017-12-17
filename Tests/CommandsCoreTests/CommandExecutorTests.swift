//
//  CommandExecutorTests.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import XCTest
@testable import CommandsCore

class CommandExecutorTests: XCTestCase {

    let commandExecutor = CommandExecutor()

    func testCommandExecutorExecutesCommandWithArguments() {
        let command = Command(launchPath: "/bin/echo", arguments: ["hello world"])
        XCTAssertNoThrow(commandExecutor.execute(command))
    }

    func testCommandExecutorExecutesCommand() {
        let command = Command(launchPath: "/bin/echo")
        XCTAssertNoThrow(commandExecutor.execute(command))
    }
}

