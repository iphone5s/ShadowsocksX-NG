//
//  SSServersWindowController.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/21.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa

class SSServersWindowController: NSWindowController,NSTableViewDelegate,NSTableViewDataSource {

    @IBOutlet weak var m_tableView:NSTableView!
    @IBOutlet weak var m_selectBtn:NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.configUI()
//        m_tableView.headerView?.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        m_tableView.reloadData();
    }
    
    func configUI() {
//        self.window?.contentView?.wantsLayer = true;
//        self.window?.contentView?.layer?.backgroundColor = NSColor.red.cgColor;
        m_tableView.delegate = self;
        m_tableView.dataSource = self;
        m_tableView.rowHeight = 30;

        m_selectBtn.font = NSFont.systemFont(ofSize: 11);
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let contentView = NSView();
        let line = NSView(frame: CGRect(x: 0, y: 0, width: tableColumn!.width, height: 0.5));
        line.wantsLayer = true;
        line.layer?.backgroundColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.2).cgColor;
        
        contentView.addSubview(line);
        
        let y = (m_tableView.rowHeight - 17) / 2.0;
        
        let label = NSTextField(frame: CGRect(x: 0, y: y, width: tableColumn!.width, height: 17));
        contentView.addSubview(label);
        
        label.wantsLayer = true;
        label.backgroundColor = NSColor.red;
        label.isBordered = false;
        label.isEditable = false;
        label.isSelectable = false;
        label.backgroundColor = NSColor.clear;
        label.font = NSFont.systemFont(ofSize: 12);
        label.textColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.5);
        
        label.alignment = NSTextAlignment.left;
        
        if (tableColumn?.title == "服务器") {
            label.stringValue = "美国加利福尼亚01";
        }else if(tableColumn?.title == "网络延迟"){
            label.stringValue = "100毫秒";
        }else if(tableColumn?.title == "连通率"){
            label.stringValue = "100%";
        }else if(tableColumn?.title == "在线人数"){
            label.stringValue = "231人";
        } else if(tableColumn?.title == "状态"){
            label.stringValue = "极速";
        }
        
        return contentView;
        
    }
    
//    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
//        return 30;
//    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true;
    }

}
