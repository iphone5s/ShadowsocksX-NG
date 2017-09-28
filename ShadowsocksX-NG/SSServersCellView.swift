//
//  SSServersCellView.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/28.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa

class SSServersCellView: NSView {
    
    var m_line:NSView!
    var m_label:NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.configUI()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    private func configUI() {
        m_line = NSView();
        self.addSubview(m_line)
        m_line.wantsLayer = true;
        m_line.layer?.backgroundColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.2).cgColor;
        
        m_label = NSTextField();
        self.addSubview(m_label)
        m_label.wantsLayer = true;
        m_label.backgroundColor = NSColor.red;
        m_label.isBordered = false;
        m_label.isEditable = false;
        m_label.isSelectable = false;
        m_label.backgroundColor = NSColor.clear;
        m_label.font = NSFont.systemFont(ofSize: 12);
        m_label.textColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0.5);
        m_label.alignment = NSTextAlignment.left;

    }
    
    func configWithModel(model:String) {
        m_label.stringValue = model;
    }
    
    override func layout() {
        
        m_line.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0.5);
        m_label.frame = CGRect(x: 0, y: (self.frame.height - 17) / 2.0, width: self.frame.width, height: 17);
    }
    
    
}
