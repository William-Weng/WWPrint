//
//  WWLogger.swift
//  WWPrint
//
//  Created by William.Weng on 2023/8/15.
//

import OSLog

// MARK: - WWLogger
open class WWLogger {
    
    /// Logger的等級
    public enum LoggerLevel: UInt {
        
        case debug = 0
        case info = 1
        case notice = 2
        case warning = 3
        case critical = 4
        
        /// 說明相關區別
        /// - Returns: String
        func tips() -> String {
            switch self {
            case .debug: return "不保存到磁碟 / 用來記錄偵錯階段一些有用的資訊"
            case .info: return "只有使用日誌工具收集時才會保存到磁碟 / 記錄對排查問題有用但不關鍵的資訊"
            case .notice: return "保存到磁碟，有上限控制 / 記錄排查問題的關鍵資訊"
            case .warning: return "保存到磁碟，有上限控制 / 記錄運行期間發生的錯誤，如果 activity 存在，系統將記錄相關處理鏈"
            case .critical: return "保存到磁碟，有上限控制 / 記錄 bug 和致命錯誤，如果 activity 存在，系統將記錄相關處理鏈"
            }
        }
    }
    
    private var logger: Logger?
    
    private init() {}
}

// MARK: - public function
public extension WWLogger {
    
    /// 建立WWLogger
    /// - Parameters:
    ///   - subsystem: String
    ///   - category: String
    /// - Returns: WWLogger
    static func build(subsystem: String, category: String = "Default") -> WWLogger {
        
        let logger = WWLogger()
        logger.logger = os.Logger(subsystem: subsystem, category: category)
        
        return logger
    }
    
    /// 建立WWLogger
    /// - Parameters:
    ///   - bundle: Bundle
    ///   - category: String
    /// - Returns: WWLogger?
    static func build(bundle: Bundle = .main, category: String = "Default") -> WWLogger? {
        guard let subsystem = bundle.bundleIdentifier else { return nil }
        return Self.build(subsystem: subsystem, category: category)
    }
    
    /// [主控台輸出](https://mp.weixin.qq.com/s/On3vVRu_gQwT9eT7Do62BQ)
    /// - Parameters:
    ///   - message: OSLogMessage
    ///   - level: LoggerLevel
    func message(_ message: String, level: LoggerLevel = .notice) {
        
        guard let logger = logger else { return }
        
        switch level {
        case .debug: logger.debug("\(message)")
        case .info: logger.info("\(message)")
        case .notice: logger.notice("\(message)")
        case .warning: logger.warning("\(message)")
        case .critical: logger.critical("\(message)")
        }
    }
}
