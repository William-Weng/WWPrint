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

/// [強制讓App自殺閃退](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/檢查條件是否滿足和讓-app-自殺的-assert-precondition-和-fatalerror-4ba8f437471f)
/// - Parameters:
///   - message: 訊息文字
///   - file: 檔案名稱
///   - line: 所在行數
public func wwFatalError<T>(_ message: T, file: StaticString = #file, line: UInt = #line) {
    Swift.fatalError("\n🈲 \(message)", file: file, line: line)
}

/// [有條件讓App自殺閃退 for Debug模式](https://medium.com/@andrewwuuw/一起來看-swift-官方文件-assertions-and-preconditions-e7a15362c715)
/// - Parameters:
///   - condition: 閃退條件 (false)
///   - message: 訊息文字
///   - file: 檔案名稱
///   - line: 所在行數
public func wwAssert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    let newMessage = "🚷 \(message())"
    Swift.assert(condition(), newMessage, file: file, line: line)
}

/// [檢查後已經確定要強制App閃退 for Debug模式](https://cootie8788.medium.com/assertionfailure-說明-f4bb5b0c8cd9)
/// - Parameters:
///   - message: 訊息文字
///   - file: 檔案名稱
///   - line: 所在行數
public func wwAssertionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    let newMessage = "🙅‍♀️ \(message())"
    Swift.assertionFailure(newMessage, file: file, line: line)
}

/// 有條件讓App自殺閃退
/// - Parameters:
///   - condition: 閃退條件 (false)
///   - message: 訊息文字
///   - file: 檔案名稱
///   - line: 所在行數
public func wwPrecondition(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    let newMessage = "🔞 \(message())"
    Swift.precondition(condition(), newMessage, file: file, line: line)
}

/// 檢查後已經確定要強制App閃退
/// - Parameters:
///   - message: 訊息文字
///   - file: 檔案名稱
///   - line: 所在行數
public func wwPreconditionFailure(_ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    let newMessage = "🙅‍♂️ \(message())"
    Swift.preconditionFailure(newMessage, file: file, line: line)
}

// 記錄一下ObjC的版本 => WWLog.h
/// #define WWLog(fmt, ...) NSLog((@"\n🚩%@:%d => %s\n\t✅ " fmt), [[NSString stringWithUTF8String: __FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
