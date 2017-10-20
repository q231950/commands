//
//  CommandExecutorTests.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import XCTest
import CommandsCore

class CommandExecutorTests: XCTestCase {

    func testCommandExecutorExecutes() {
        let commandExecutor = CommandExecutor(launchPath: "/bin/echo", arguments: ["hello world"])
        XCTAssertNoThrow(commandExecutor.executeCommand())
    }
}

