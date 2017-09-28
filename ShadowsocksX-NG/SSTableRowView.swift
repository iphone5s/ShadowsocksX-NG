//
//  SSTableRowView.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/28.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa

class SSTableRowView: NSTableRowView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func drawSelection(in dirtyRect: NSRect) {
        let selectionRect = dirtyRect;
        NSColor(calibratedWhite: 0.6, alpha: 1).setStroke()
        NSColor(calibratedWhite: 0.8, alpha: 1).setFill()
        let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 0, yRadius: 0)
        selectionPath.fill()
        selectionPath.stroke()
    }
}
