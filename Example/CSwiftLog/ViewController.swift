//
//  ViewController.swift
//  CSwiftLog
//
//  Created by Andrew on 10/05/2021.
//  Copyright (c) 2021 Andrew. All rights reserved.
//

import UIKit
import CSwiftLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Log.log("Message text without category")
        Log.my.log("Message text with custom category")
        Log.network.log("Message text with network category")
        
        Log.ui.log("Message text simple")
        Log.ui.log(tag: "TAG", "Message text with tag")
        Log.ui.log(tag: "TAG", "Message text with not default type", .success)
        Log.ui.log(tag: "TAG", "Message text with full form style", .error, style: .full)
        
        Log.ui.log("Success type", .success, style: .full)
        Log.ui.log("Into type", .info, style: .full)
        Log.ui.log("Error type", .error, style: .full)
        Log.ui.log("Warning type", .warning, style: .full)
        Log.ui.log("Canceled type", .canceled, style: .full)
    }

}

extension Log {
    
    static let my = Log(category: "MY_CATEGORY")
    static let model = Log(category: "MODEL")
    
}

