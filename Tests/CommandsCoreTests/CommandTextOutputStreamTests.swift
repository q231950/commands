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
        let outputStream = CommandTextOutputStream()
        outputStream.textHandler = { text in
            XCTAssertEqual(text, "resillient koala\n")
        }
        if let scriptPath = "echo 'resillient koala' && exit".makeScript(for: type(of: self)) {
            let commandExecutor = CommandExecutor(launchPath: "/bin/sh", arguments: [scriptPath], outputStream: outputStream)
            commandExecutor.executeCommand()
        } else {
            XCTFail()
        }
    }
}
