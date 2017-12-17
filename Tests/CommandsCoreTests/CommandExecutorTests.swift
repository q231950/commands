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

    func testOutput() {
        let expectation = self.expectation(description: "script done")

        if let scriptPath = "echo 'resillient koala' && exit".makeScript(named: "OutputTestScript") {
            let commandExecutor = CommandExecutor()
            commandExecutor.outputHandler = { text in
                XCTAssertEqual(text, "resillient koala\n")
                expectation.fulfill()
            }
            let command = Command(launchPath: "/bin/sh", arguments: [scriptPath])
            commandExecutor.execute(command)
        } else {
            XCTFail()
        }

        wait(for: [expectation], timeout: 0.1)
    }
}

