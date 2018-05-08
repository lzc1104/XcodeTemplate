//
//  NetworkConfiguration.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/2.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import Foundation

/// 网络配置
class NetworkConfiguration {
    /// Api地址
    static var api: String = ""
    /// 秘钥对
    static var secretKeys: [String: String] = [:]
    /// 鉴权
    static var accessToken: String? = ""
    /// 日志输出级别 - [none,brief,detail]
    static var loglevel: String = "detail"
    /// TODO:- 单点登录处理类
    static var ssoHandler: AnyClass? = nil
}

/// DNS配置
class DNSConfiguration {
    /// 账号
    static var accountId: String = ""
    /// 预解析域名
    static var preResolveHosts: [String] = []
    /// 启用本地DNS解析开关
    static var enable: Bool = true
    
}



