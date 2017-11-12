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
    let launchPath: String
    let arguments: [String]

    public init(launchPath: String, arguments: [String], outputStream: OutputStream = StandardOutOutputStream()) {
        self.launchPath = launchPath
        self.arguments = arguments
        self.outputStream = outputStream
    }

    public func execute() {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments

        let pipe = outputStreamWritingPipe()
        process.standardOutput = pipe
        process.standardError = pipe

        process.standardInput = inputPipe

        process.launch()
        process.waitUntilExit()
    }

    private func outputStreamWritingPipe() -> Pipe {
        let outputPipe = Pipe()
        outputPipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            if data.count > 0 {
                self?.outputStream.write([UInt8](data), maxLength: data.count)
            }
        }

        return outputPipe
    }
    
    public func write(input: String) {
        if let data = "\(input)\n".data(using: .utf8) {
            inputPipe.fileHandleForWriting.write(data)
        }
    }
}
