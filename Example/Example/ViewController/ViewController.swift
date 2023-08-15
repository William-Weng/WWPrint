//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2021/9/14.
//
// ~/Library/Caches/org.swift.swiftpm/

import UIKit
import WWPrint

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let message = wwMessage("iOS好棒棒")
        let logger = WWLogger.build()
        
        print(message)
        wwPrint("Hello World!!!")
        
        logger?.message("debug", level: .debug)
        logger?.message("info", level: .info)
        logger?.message("notice", level: .notice)
        logger?.message("warning", level: .warning)
        logger?.message("critical", level: .critical)
    }
}

