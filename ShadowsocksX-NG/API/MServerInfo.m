//
//  MServerInfo.m
//  ShadowsocksX-NG
//
//  Created by ezreal on 2017/9/29.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

#import "MServerInfo.h"
#import <MJExtension/MJExtension.h>

@implementation MServerInfo

+(void)load{
    [MServerInfo mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"server_name" forKey:@"strServerName"];
        return dict;
    }];
}
    
@end
