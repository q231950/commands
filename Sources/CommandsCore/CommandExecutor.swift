//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

class CommandExecutor {

    func executeCommand(at launchPath: String, arguments: [String]) {
        let consoleStream = StandardOutOutputStream()
        executeCommand(at: launchPath, arguments: arguments, outputStream: consoleStream)
    }

    func executeCommand(at launchPath: String, arguments: [String], outputStream: OutputStream) {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        let pipe = Pipe()
        process.standardOutput = pipe
        pipe.fileHandleForReading.readabilityHandler = { handle in
            let data = handle.availableData
            outputStream.write([UInt8](data), maxLength: data.count)
        }
        process.launch()
        process.waitUntilExit()
    }
}
