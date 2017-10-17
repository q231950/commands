//
//  TextOutputStream.swift
//  CommandsPackageDescription
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

class CommandTextOutputStream: OutputStream {

    var textHandler: ((String) -> Void)?

    override func write(_ buffer: UnsafePointer<UInt8>, maxLength len: Int) -> Int {

        let data = Data.init(bytes: buffer, count: len)
        let text = String(data: data, encoding: String.Encoding.utf8)
        if let textHandler = textHandler, let text = text {
            textHandler(text)
        }

        return len
    }

    override func close() {
    }
}



