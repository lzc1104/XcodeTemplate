//
//  BasicConfigManager.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/7.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import UIKit
import CommonLib
import HuayingRequest
import LevelDBManager

//extension LevelDB: StoreServiceType {}
//
//extension PBTexasConfig: Protocolbuf {}
//
//class TexasConfigManager: NSObject {
//
//    static let shared = TexasConfigManager()
//
//    private override init() {
//        super.init()
//    }
//
//    internal var texasConfig: PBTexasConfig? {
//        let texasConfig = _configManager.businessConfig
//        return texasConfig
//    }
//
//    private var basicConfig: PBBasicConfig? {
//        let basicConfig = _configManager.basicConfig
//        return basicConfig
//    }
//
//    fileprivate var priceConfig: PBPriceConfig? {
//        let priceConfig = _configManager.businessConfig?.priceConfig
//        return priceConfig
//    }
//    
//    fileprivate var urlConfig: PBUrlConfig? {
//        let urlConfig = _configManager.businessConfig?.urlConfig
//        return urlConfig
//    }
//
//    fileprivate var aboutConfig: PBAboutConfig? {
//        let aboutConfig = texasConfig?.aboutConfig
//        return aboutConfig
//    }
//
//    private let _configManager: BasicConfigManager<PBTexasConfig> = {
//        let localConfigFilePath = Bundle.main.path(forResource: "config_ios", ofType: "pb")
//        let manager = BasicConfigManager<PBTexasConfig>(network: BasicNetworkService(), store: LevelDB(dbName: "config_db"), localConfigFilePath: localConfigFilePath)
//        return manager
//    }()
//
//    func writeBasicConfigToSandBox() {
//        _configManager.storeBasicConfigIntoFile()
//    }
//
//    var texasQiniuTokenHost: PBQiniuTokenHost? {
//        let defaultTokens = basicConfig?.qiniuHostTokensArray as? [PBQiniuTokenHost]
//        return (defaultTokens ?? []).first { $0.tag == UInt32(PBQiniuTag.qiniuTexas.rawValue) }
//    }
//
//    var clubApplyTips: String {
//        return texasConfig?.clubApplyTips ?? "注意：名称、平台及创建时间，认证后不可再修改!"
//    }
//
//    var iOSVersion: PBIOSVersion? {
//        return basicConfig?.iosVersion
//    }
//
//    var httpDnsAccount: String {
//        return basicConfig?.httpDnsAccount ?? ""
//    }
//
//}

