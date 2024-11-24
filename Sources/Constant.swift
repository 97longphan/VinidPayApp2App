//
//  Constant.swift
//  VinidPayApp2App
//
//  Created by LONGPHAN on 24/11/2024.
//
import Foundation

enum SDKConstant {
    enum Default {
        static let vinIDSchemeUAT = "com.one.oneid.UAT://"
        static let vinIDSchemePROD = "com.vingroup.VinIDApp://"
        static let vinIDCheckoutDeepLinkFormat = "one://superapp/checkout?order_id=%@&signature=%@&extra_data&returnURLScheme=%@"
        static let vinIDAppStore = "itms-apps://itunes.apple.com/app/id1215495998"
    }
    
    enum ReturnURLKey {
        static let status = "status"
    }
}