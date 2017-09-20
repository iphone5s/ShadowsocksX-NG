//
//  MTASocket.m
//  MTADemo
//
//  Created by ezreal on 2017/9/18.
//  Copyright © 2017年 ezreal. All rights reserved.
//

#import "MTASocket.h"
#import "MTAHelper.h"

#import "GCDAsyncSocket.h"

@interface MTASocket ()<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *m_socket;
}
@end

@implementation MTASocket

- (instancetype)init
{
    self = [super init];
    if (self) {
        m_socket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        
        [m_socket connectToHost:@"pingma.qq.com" onPort:80 error:nil];
    }
    return self;
}

-(void)sendData:(NSDictionary *)dataDict
{
    NSData *resultData = [MTAHelper getPacketData:dataDict];
    [m_socket writeData:resultData withTimeout:10 tag:0];
}


- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    
}

-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    [m_socket readDataWithTimeout:10 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"");
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(nullable NSError *)err
{

}

@end
