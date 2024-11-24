//
//  VinIDPay.swift
//  VinidPayApp2App
//
//  Created by LONGPHAN on 24/11/2024.
//
import Foundation

public class VinIDPay {

    public static var sharedInstance: VinIDPay = VinIDPay()
    public var returnURLScheme = ""
    public var sandboxMode: Bool = false
    public var hasVinIDAppInstalled: Bool {
        let urlVinIDSchemeApp = sandboxMode ? SDKConstant.Default.vinIDSchemeUAT : SDKConstant.Default.vinIDSchemePROD
        if let url = URL(string: urlVinIDSchemeApp) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    private var paymentCompletion: ((String, VinIDPaySDKResult?) -> Void)?

    public init() {}
    
    public func pay(withOrderId: String, signature: String, extraData: String?, completion: ((String, VinIDPaySDKResult?) -> Void)?) {
        self.paymentCompletion = completion
        let urlString = String(format: SDKConstant.Default.vinIDCheckoutDeepLinkFormat, withOrderId, signature, extraData ?? "", returnURLScheme)
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    public func navigateToAppStore() {
        guard let url = URL(string: SDKConstant.Default.vinIDAppStore),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    public func handleReturnURL(_ url: URL) {
        if let completion = self.paymentCompletion, let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            let statusValue = components.queryItems?.first(where: { $0.name == SDKConstant.ReturnURLKey.status})?.value ?? ""
            let statusRawValue = Int(statusValue) ?? VinIDPaySDKResult.aborted.rawValue
            let status = VinIDPaySDKResult(rawValue: statusRawValue)
            completion("", status)
        }
        
        self.paymentCompletion = nil
    }
}
