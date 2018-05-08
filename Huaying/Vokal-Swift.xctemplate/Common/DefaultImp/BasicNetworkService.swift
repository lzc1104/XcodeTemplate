//
//  BasicNetworkService.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/7.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import Foundation
import HuayingRequest
import Device
import UICKeyChainStore
import FoundationExtension
import SwiftProtobuf
import Alamofire


extension AliHttpDNSAdapter: DNSServiceType {}

struct Network {
    
    static let networkStatus = NetworkStatus()
    static let aliHttpDNSService: DNSServiceType = {
        AliHttpDNSAdapter.shared.setup(
            accountId: DNSConfiguration.accountId.int32Value ?? 0,
            preResolveHosts: DNSConfiguration.preResolveHosts
        )
        return AliHttpDNSAdapter.shared
    }()
}

extension LogLevel {
    init(_ level: String){
        switch level {
        case "none":
            self = .none
        case "brief":
            self = .brief
        case "detail":
            self = .detail
        default:
            self = .brief
        }
    }
}


class BasicNetworkService: HuayingRequestServiceType {
    @discardableResult
    func response<T>(type: UInt32, message: Message?, accessory: RequestAccessorable?, completed: @escaping (Result<T>) -> Void) -> HuayingRequestType? where T : Message {
        return self.response(type: type, message: message, accessory: accessory, completed: completed)
    }
    
    func response(type: UInt32, message: Message?, accessory: RequestAccessorable?, completed: @escaping (Result<Void>) -> Void) -> HuayingRequestType? {
        return self.response(type: type, message: message, accessory: accessory, completed: completed)
    }
    
    func response<T>(type: UInt32, message: Message?, accessory: RequestAccessorable?, success: ((T) -> Void)?, failure: ((NSError) -> Void)?) -> HuayingRequestType? where T : Message {
        return self.response(type: type, message: message, accessory: accessory, success: success, failure: failure)
    }
    
    func response(type: UInt32, message: Message?, accessory: RequestAccessorable?, success: (() -> Void)?, failure: ((NSError) -> Void)?) -> HuayingRequestType? {
        return self.response(type: type, message: message, accessory: accessory, success: success, failure: failure)
    }
    
    
    var baseUrl: String { return NetworkConfiguration.api }
    
    var secretKeys: [String: String] { return NetworkConfiguration.secretKeys }
    
    var httpDNSService: DNSServiceType? { return DNSConfiguration.enable ? Network.aliHttpDNSService : nil }
    
    var singleSigninCenter: SingleSigninProtocol?
    
    var accessToken : String? { return NetworkConfiguration.accessToken }
    
    var logLevel: LogLevel { return LogLevel(NetworkConfiguration.loglevel) }
    
    var currentDevice: DeviceInfo? {
        let deviceId = UIDevice.current.deviceId
        let deviceOS = UIDevice.current.systemName + UIDevice.current.systemVersion
        let deviceModel = Device.version().rawValue
        let device = DeviceInfo(deviceId: deviceId, deviceOS: deviceOS, deviceModel: deviceModel)
        return device
    }
    var currentNetwork: NetworkInfo? {
        let networkType: NetworkInfo.NetworkType = {
            let status = Network.networkStatus.currentNetworkStatus
            switch status {
            case .unknow:
                return .unknow
            case .wifi:
                return .wifi
            case .cellular2G:
                return .cellular2G
            case .cellular3G:
                return .cellular3G
            case .cellular4G:
                return .cellular4G
            case .notReachable:
                return .unknow
            }
        }()
        return NetworkInfo(networkType: networkType)
    }
    
    
}

extension UIDevice {
    
    public var deviceId: String {
        guard let deviceId = UICKeyChainStore.string(forKey: "DeviceUniqueIdentifier") else {
            let deviceId = UUID().uuidString
            UICKeyChainStore.setString(deviceId, forKey: "DeviceUniqueIdentifier")
            return deviceId
        }
        return deviceId
    }
}
