#!/bin/sh

#  stop_privoxy.sh
#  ShadowsocksX-NG
#
#  Created by 王晨 on 16/10/7.
#  Copyright © 2016年 zhfish. All rights reserved.

launchctl stop com.xiezhen.vpn.http
launchctl unload "$HOME/Library/LaunchAgents/com.xiezhen.vpn.http.plist"
