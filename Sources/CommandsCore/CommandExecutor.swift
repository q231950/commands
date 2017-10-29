//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

public class CommandExecutor {
    
    private let outputStream: OutputStream
    private let inputPipe = Pipe()
    private let launchPath: String
    private let arguments: [String]

    public init(launchPath: String, arguments: [String], outputStream: OutputStream = StandardOutOutputStream()) {
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

        process.standardInput = inputPipe

        process.launch()
        process.waitUntilExit()
    }
    
    public func write(input: String) {
        if let data = "\(input)\n".data(using: .utf8) {
            inputPipe.fileHandleForWriting.write(data)
        }
    }
}
