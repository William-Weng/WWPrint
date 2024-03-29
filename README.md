# WWPrint
[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWPrint) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- The number of lines that can be printed + the printing method of the method name => convenient for debugging
- 可以印出行數 + 方法名稱的Print方法 / [WWLogger](https://mp.weixin.qq.com/s/On3vVRu_gQwT9eT7Do62BQ) => 方便Debug

![](./Example.png)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWPrint.git", .upToNextMajor(from: "1.2.0"))
]
```

### Function - 可用函式
|函式|功能|
|-|-|
|wwPrint(_:file:method:line:isShow:)|可以印出行數 + 方法名稱的Print方法 => 方便Debug|
|build(subsystem:category:)|建立WWLogger|
|build(bundle:category:)|建立WWLogger|
|message(_:level:)|主控台輸出|
|wwMessage(_:file:method:line:)|可以印出行數的Debug字串|
|wwFatalError(_:file:line:)|強制讓App自殺閃退|
|wwAssert(_:message:file:line:)|有條件讓App自殺閃退 for Debug模式|
|wwAssertionFailure(_:file:line:)|檢查後已經確定要強制App閃退 for Debug模式|
|wwPrecondition(_:message:file:line:)|有條件讓App自殺閃退|
|wwPreconditionFailure(_:file:line:)|檢查後已經確定要強制App閃退|

### Example
```swift
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
```

