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
        
        m_tableView.reloadData();
    }
    
    func configUI() {
        
        m_tableView.delegate = self;
        m_tableView.dataSource = self;
        m_tableView.rowHeight = 30;
        m_tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyle.regular;
        m_selectBtn.font = NSFont.systemFont(ofSize: 11);
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100;
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let rowView = SSTableRowView();
        return rowView;
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = SSServersCellView();
        let model:String
        
        if (tableColumn?.title == "服务器") {
            model = "美国加利福尼亚01";
        }else if(tableColumn?.title == "网络延迟"){
            model = "100毫秒";
        }else if(tableColumn?.title == "连通率"){
            model = "100%";
        }else if(tableColumn?.title == "在线人数"){
            model = "231人";
        } else if(tableColumn?.title == "状态"){
            model = "极速";
        }else{
            model = "";
        }
        cellView.configWithModel(model: model)
        
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true;
    }
    
    
}
