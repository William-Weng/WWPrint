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
        print(message)
        
        wwPrint("Hello World!!!")
    }
}

