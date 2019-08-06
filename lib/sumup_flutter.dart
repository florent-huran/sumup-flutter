import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';

class SumupFlutter {
  static const MethodChannel _channel =
  const MethodChannel('sumup_flutter');

  static Future<Null> authenticate(String APIKey) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("APIKey", () => APIKey);
    await _channel.invokeMethod("authenticate", args);
    return null;
  }

  static Future<Null> presentLoginView() async {
    return await _channel.invokeMethod("presentLoginView");
  }

  static Future<bool> checkout(SumupCheckoutRequest checkoutRequest) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("amount", () => checkoutRequest.amount);
    args.putIfAbsent("title", () => checkoutRequest.title);
    args.putIfAbsent("currencyCode", () => checkoutRequest.currencyCode);
    return await _channel.invokeMethod("sendCheckout", args);
  }

  static Future<bool> isLoggedIn() async {
    return await _channel.invokeMethod("isLoggedIn");
  }
}

class SumupCheckoutRequest {

  String amount;
  String title;
  String currencyCode;

  SumupCheckoutRequest({@required this.amount, @required this.title, @required this.currencyCode});

}