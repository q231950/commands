//
//  CommandsTests.swift
//  CommandsCoreTests
//
//  Created by Martin Kim Dung-Pham on 20.01.18.
//

import XCTest
@testable import CommandsCore

class CommandsTests: XCTestCase {
    
    func testExecutesScript() {
        if let path = "echo 'hello world' && echo 'hello second world' && exit".makeScript(named: "ExecutesScript") {
            let arguments = ["Commands", "/bin/sh", path]
            let commands = Commands(arguments: arguments)
            XCTAssertNoThrow(try commands.run())
        } else {
            XCTFail()
        }
    }
}
