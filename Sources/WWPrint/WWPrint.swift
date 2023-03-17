import Foundation

// MARK: - 可以印出行數 + 方法名稱的Print方法 => 方便Debug
public func wwPrint<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    let message = wwMessage(message, file: file, method: method, line: line)
    Swift.print(message)
}

// MARK: - 可以印出行數的Debug字串
public func wwMessage<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) -> String {
    return "🚩 \((file as NSString).lastPathComponent)：\(line) - \(method) \n\t ✅ \(message)"
}

// 記錄一下ObjC的版本 => WWLog.h
/// #define WWLog(fmt, ...) NSLog((@"\n🚩%@:%d => %s\n\t✅ " fmt), [[NSString stringWithUTF8String: __FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
