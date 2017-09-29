//
//  SSServersWindowController.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/21.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa
import YTKNetwork

class SSServersWindowController: NSWindowController,NSTableViewDelegate,NSTableViewDataSource {

    @IBOutlet weak var m_tableView:NSTableView!
    @IBOutlet weak var m_selectBtn:NSButton!
    var m_dataArray:NSMutableArray!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        m_dataArray = NSMutableArray();
        self.configUI()
        self.reloadData();
    }
    
    func configUI() {
        m_tableView.delegate = self;
        m_tableView.dataSource = self;
        m_tableView.rowHeight = 30;
        m_tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyle.regular;
        m_selectBtn.font = NSFont.systemFont(ofSize: 11);
    }
    
    func reloadData() {
        let api = APIGetServers();
        api.startWithCompletionBlock(success: { (request:YTKBaseRequest) in
            
            self.m_dataArray.addObjects(from: request.responseModel as! [Any])
            self.m_tableView.reloadData();
        }) { (request:YTKBaseRequest) in
            NSLog("failed");
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return m_dataArray.count;
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let rowView = SSTableRowView();
        return rowView;
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = SSServersCellView();
        let strModel:String
        
        if (tableColumn?.title == "服务器") {
            let model:MServerInfo = m_dataArray.object(at: row) as! MServerInfo
            strModel = model.strServerName
        }else if(tableColumn?.title == "网络延迟"){
            strModel = "100毫秒";
        }else if(tableColumn?.title == "连通率"){
            strModel = "100%";
        }else if(tableColumn?.title == "在线人数"){
            strModel = "231人";
        } else if(tableColumn?.title == "状态"){
            strModel = "极速";
        }else{
            strModel = "";
        }
        cellView.configWithModel(model: strModel)
        
//        let data = NSData
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true;
    }
    
    
}
