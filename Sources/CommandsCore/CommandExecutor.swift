//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

public class CommandExecutor {

    public
    var outputHandler: ((String) -> ())?
    
    private
    let inputPipe = Pipe()
    let process = Process()

    public func execute(_ command: Command) {
        process.launchPath = command.launchPath
        process.arguments = command.arguments

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
            if data.count > 0, let output = String(data: data, encoding: .utf8) {
                self?.outputHandler?(output)
            }
        }

        return outputPipe
    }
    
    public func write(input: String) {
        if let data = "\(input)\n".data(using: .utf8) {
            inputPipe.fileHandleForWriting.write(data)
        }
    }
    
    public func terminate() {
        process.terminate()
    }
}
