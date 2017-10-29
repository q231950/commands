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

    public init(launchPath: String, arguments: [String], outputStream: OutputStream = StandardOutOutputStream()) {
        self.launchPath = launchPath
        self.arguments = arguments
        self.outputStream = outputStream
    }

    public func execute() {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        let pipe = Pipe()
        process.standardOutput = pipe
        let errorPipe = Pipe()
        process.standardError = errorPipe
        writeToOuputStream(pipe: pipe)
        writeToOuputStream(pipe: errorPipe)
        process.launch()
        process.waitUntilExit()
    }
    
    func writeToOuputStream(pipe: Pipe) {
        pipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            self?.outputStream.write([UInt8](data), maxLength: data.count)
        }
    }
}
