#import "SumupFlutterPlugin.h"
#import <sumup_flutter/sumup_flutter-Swift.h>

@implementation SumupFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSumupFlutterPlugin registerWithRegistrar:registrar];
}
@end
