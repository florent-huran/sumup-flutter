import Flutter
import UIKit
import SumUpSDK

public class SwiftSumupFlutterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "sumup_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftSumupFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print(call.method)
        if call.method == "authenticate" {
            let arguments = call.arguments as? NSDictionary
            let APIKey = arguments?["APIKey"] as? String
            guard let key = APIKey else { return }
            authenticate(APIKey: key)
            result(nil)
        } else if call.method == "presentLoginView" {
            presentLoginView() { (success) in
                result(success)
            }
        } else if call.method == "sendCheckout" {
            let arguments = call.arguments as? NSDictionary
            let _amount = arguments?["amount"] as? String
            let title = arguments?["title"] as? String
            let _currencyCode = arguments?["currencyCode"] as? String
            guard let amount = _amount,
                let currencyCode = _currencyCode else { return }
            sendCheckout(total: amount, title: title, currencyCode: currencyCode) { (success) in
                result(success)
            }
        } else if call.method == "isLoggedIn" {
            result(SumUpSDK.isLoggedIn);
        } else {
            print("nope")
        }
    }
    
    private func authenticate(APIKey: String) {
        SumUpSDK.setup(withAPIKey: APIKey)
    }
    
    private func presentLoginView(completion: @escaping ((Bool) -> ())) {
        SumUpSDK.presentLogin(from: UIApplication.shared.keyWindow!.rootViewController!, animated: true) { (loggedIn, _) in
            print(loggedIn)
            completion(loggedIn)
        }
    }
    
    private func sendCheckout(total: String, title: String?, currencyCode: String, completion: @escaping ((Bool) -> ())) {
        let checkoutRequest = CheckoutRequest(total: NSDecimalNumber.init(string: total), title: title, currencyCode: currencyCode)
        SumUpSDK.checkout(with: checkoutRequest, from: UIApplication.shared.keyWindow!.rootViewController!, completion: ({ (result, error) in
            guard let result = result else {
                completion(false)
                return
            }
            completion(result.success)
        }))
        
    }
    
}
