//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

public class CommandExecutor {

    let launchPath: String
    let arguments: [String]
    let outputStream: OutputStream

    public init(launchPath: String, arguments: [String],
                outputStream: OutputStream = StandardOutOutputStream()) {
        self.launchPath = launchPath
        self.arguments = arguments
        self.outputStream = outputStream
    }

    public func execute() {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments

        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        outputPipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            self?.outputStream.write([UInt8](data), maxLength: data.count)
        }

        let inputPipe = Pipe()
        process.standardInput = inputPipe
        process.launch()

        while let input = readLine() {
            inputPipe.fileHandleForWriting.write("\(input)\n".data(using: .utf8)!)
        }

        process.waitUntilExit()
    }
}
