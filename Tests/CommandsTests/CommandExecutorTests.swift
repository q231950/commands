//
//  CommandExecutorTests.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import XCTest
@testable import Commands

class CommandExecutorTests: XCTestCase {

    let commandExecutor = CommandExecutor()

    func testCommandExecutorExecutesCommandWithArguments() {
        let outputExpectation = expectation(description: "output expectation")
        let command = Command(launchPath: "/bin/echo", arguments: ["hello world"])
        commandExecutor.outputHandler = { text in
            XCTAssertEqual(text, "hello world\n")
        }
        commandExecutor.terminationHandler = { _ in
            outputExpectation.fulfill()
        }
        commandExecutor.execute(command)
        wait(for: [outputExpectation], timeout: 0.1)
    }

    func testCommandExecutorExecutesCommand() {
        let outputExpectation = expectation(description: "output expectation")
        let command = Command(launchPath: "/usr/bin/whoami")
        commandExecutor.outputHandler = { text in
            XCTAssertTrue(text.count >= 3, "whoami should output a name with at least 3 characters")
        }
        commandExecutor.terminationHandler = { _ in
            outputExpectation.fulfill()
        }
        commandExecutor.execute(command)
        wait(for: [outputExpectation], timeout: 0.1)
    }

    func testOutput() {
        let expectation = self.expectation(description: "script done")

        if let scriptPath = "echo 'resilient koala' && exit".makeScript(named: "OutputTestScript") {
            let commandExecutor = CommandExecutor()
            commandExecutor.outputHandler = { text in
                XCTAssertEqual(text, "resilient koala\n")
            }
            commandExecutor.terminationHandler = { _ in
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

