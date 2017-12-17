//
//  TextOutputStreamTests.swift
//  CommandsCoreTests
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import XCTest
@testable import CommandsCore

class CommandTextOutputStreamTests: XCTestCase {
    func testTextOutputStream() {
        let expectation = self.expectation(description: "script done")
        let outputStream = CommandTextOutputStream()
        outputStream.textHandler = { text in
            XCTAssertEqual(text, "resillient koala\n")
            expectation.fulfill()
        }
        if let scriptPath = "echo 'resillient koala' && exit".makeScript(named: "TextOutputStream") {
            let command = Command(launchPath: "/bin/sh", arguments: [scriptPath])
            let commandExecutor = CommandExecutor(command: command, outputStream: outputStream)
            commandExecutor.execute()
            wait(for: [expectation], timeout: 0.1)
        } else {
            XCTFail()
        }
    }
}
