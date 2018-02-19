//
//  Log.swift
//  TestUniversalLinks
//
//  Created by matsuda on 2018/02/23.
//  Copyright © 2018年 matsuda. All rights reserved.
//

import Foundation
import os.log

let logPath: String = {
    guard let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        fatalError()
    }
    print("dir >>>>\n", dir)
    return (dir as NSString).appendingPathComponent("log.txt")
}()

func createAndWriteFile() {
    let fm = FileManager.default
    if !fm.fileExists(atPath: logPath) {
        fm.createFile(atPath: logPath, contents: nil, attributes: nil)
    }
}

func log(_ text: String) {
    createAndWriteFile()
    if #available(iOS 10.0, *) {
        let osLog = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "General")
        os_log("text >>> %@", log: osLog, type: .default, text)
    } else {
        NSLog("text >>> %@", text)
    }
    guard let data = (text + "\n").data(using: .utf8) else {
        return
    }
    guard let handle = FileHandle(forWritingAtPath: logPath) else { return }
    defer {
        handle.closeFile()
    }
    handle.seekToEndOfFile()
    handle.write(data)
}
