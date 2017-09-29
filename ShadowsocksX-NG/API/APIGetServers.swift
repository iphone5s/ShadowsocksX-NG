//
//  APIGetServers.swift
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/29.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//
import YTKNetwork
import MJExtension

class APIGetServers: YTKRequest {
    override func requestUrl() -> String {
        return "index.php?m=home&c=config&a=getServers";
    }
    
    override func requestMethod() -> YTKRequestMethod {
        return YTKRequestMethod.POST;
    }
    
    override func jsonToModel(withData dataDict: [AnyHashable : Any]) -> Any {
        
        let resultArray = NSMutableArray();
        
        let data:NSDictionary = dataDict as NSDictionary
        
        let dataArray:NSArray = data.object(forKey: "data") as! NSArray
        
        for index in 0...dataArray.count - 1 {
            let dict = dataArray.object(at: index) as! NSDictionary
            let model = MServerInfo.mj_object(withKeyValues: dict)
            resultArray.add(model)
        }
        
        return resultArray;
    }
}
