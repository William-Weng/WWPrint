//
//  WWPrint.swift
//  WWPrint
//
//  Created by William.Weng on 2023/8/15.
//

import Foundation

/// - Parameters: 可以印出行數 + 方法名稱的Print方法 => 方便Debug
///   - message: 訊息文字
///   - file: 檔案名稱
///   - method: 方法名稱
///   - line: 所在行數
///   - isShow: 是否顯示
public func wwPrint<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line, isShow: Bool = true) {
    
    if (!isShow) { return }
    
    let message = wwMessage(message, file: file, method: method, line: line)
    Swift.print(message)
}

/// 可以印出行數的Debug字串
/// - Parameters:
///   - message: 訊息文字
///   - file: 檔案名稱
///   - method: 方法名稱
///   - line: 所在行數
/// - Returns: String
public func wwMessage<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) -> String {
    return "🚩 \((file as NSString).lastPathComponent)：\(line) - \(method) \n\t ✅ \(message)"
}

// 記錄一下ObjC的版本 => WWLog.h
/// #define WWLog(fmt, ...) NSLog((@"\n🚩%@:%d => %s\n\t✅ " fmt), [[NSString stringWithUTF8String: __FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
