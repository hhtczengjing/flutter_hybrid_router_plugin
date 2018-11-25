#import "FlutterHybridRouterPlugin.h"
#import <MGJRouter/MGJRouter.h>

@implementation FlutterHybridRouterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_hybrid_router" binaryMessenger:[registrar messenger]];
    FlutterHybridRouterPlugin* instance = [[FlutterHybridRouterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)block {
    if ([@"openURL" isEqualToString:call.method]) {
        id arguments = call.arguments;
        if(arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSString *pattern = [arguments objectForKey:@"url"];
            NSArray *parameters = [arguments objectForKey:@"parameters"];
            if(!pattern || pattern.length <= 0) {
                !block ? : block(nil);
                return;
            }
            NSString *url = pattern;
            if(parameters && [parameters isKindOfClass:[NSArray class]] && parameters.count > 0) {
                url = [MGJRouter generateURLWithPattern:pattern parameters:parameters];
            }
            if(!url || url.length <= 0) {
                !block ? : block(nil);
                return;
            }
            [MGJRouter openURL:url completion:^(id result) {
                !block ? : block(result);
            }];
        }
        else {
            !block ? : block(nil);
        }
    }
    else if ([@"objectForURL" isEqualToString:call.method]) {
        id arguments = call.arguments;
        if(arguments && [arguments isKindOfClass:[NSDictionary class]]) {
            NSString *pattern = [arguments objectForKey:@"url"];
            NSArray *parameters = [arguments objectForKey:@"parameters"];
            if(!pattern || pattern.length <= 0) {
                !block ? : block(nil);
                return;
            }
            NSString *url = pattern;
            if(parameters && [parameters isKindOfClass:[NSArray class]] && parameters.count > 0) {
                url = [MGJRouter generateURLWithPattern:pattern parameters:parameters];
            }
            if(!url || url.length <= 0) {
                !block ? : block(nil);
                return;
            }
            id result = [MGJRouter objectForURL:url];
            !block ? : block(result);
        }
        else {
            !block ? : block(nil);
        }
    }
    else {
        !block ? : block(FlutterMethodNotImplemented);
    }
}

@end
