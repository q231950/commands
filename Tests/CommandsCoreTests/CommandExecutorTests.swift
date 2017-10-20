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
        let commandExecutor = CommandExecutor(launchPath: "/bin/echo", arguments: ["hello world"])
        XCTAssertNoThrow(commandExecutor.execute())
    }

    func testCommandExecutorLaunchpath() {
        let commandExecutor = CommandExecutor(launchPath: "/bin/echo", arguments: [])
        XCTAssertEqual(commandExecutor.launchPath, "/bin/echo")
    }

    func testCommandExecutorArguments() {
        let commandExecutor = CommandExecutor(launchPath: "", arguments: ["hello world"])
        XCTAssertEqual(commandExecutor.arguments, ["hello world"])
    }
}

