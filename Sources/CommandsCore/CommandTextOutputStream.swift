//
//  TextOutputStream.swift
//  CommandsPackageDescription
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

public class CommandTextOutputStream: OutputStream {

    public var textHandler: ((String) -> Void)?

    public override func write(_ buffer: UnsafePointer<UInt8>, maxLength len: Int) -> Int {

        let data = Data.init(bytes: buffer, count: len)
        let text = String(data: data, encoding: .utf8)
        if let textHandler = textHandler, let text = text {
            textHandler(text)
        }

        return len
    }

    public override func close() {
    }
}



