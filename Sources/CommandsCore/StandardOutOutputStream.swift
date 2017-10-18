//
//  StandardOutOutputStream.swift
//  CommandsPackageDescription
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

public class StandardOutOutputStream: OutputStream {

    public override func write(_ buffer: UnsafePointer<UInt8>, maxLength len: Int) -> Int {
        let data = Data.init(bytes: buffer, count: len)
        let text = String(data: data, encoding: String.Encoding.utf8)
        print("\(text ?? "")")
        return len
    }

    public override func close() {
        print("Closing Console Stream")
    }
}

