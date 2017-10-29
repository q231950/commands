//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

public class CommandExecutor {
    
    let outputPipe = Pipe()
    private let inputPipe = Pipe()
    private let launchPath: String
    private let arguments: [String]

    public init(launchPath: String, arguments: [String]) {
        self.launchPath = launchPath
        self.arguments = arguments
    }
    
    public func execute() {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        
        process.standardOutput = outputPipe
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
