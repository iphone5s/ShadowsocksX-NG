//
//  SSServersWindowController.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/21.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa

class SSServersWindowController: NSWindowController {

    var m_tableView:NSTableView!
    
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.configUI()
        
    }
    
    func configUI() {
//        self.window?.contentView?.wantsLayer = true;
//        self.window?.contentView?.layer?.backgroundColor = NSColor.red.cgColor;

    }
    
}
