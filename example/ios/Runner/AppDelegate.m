#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <MGJRouter/MGJRouter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    [MGJRouter registerURLPattern:@"com.devzeng.demo://version?type=:type" toObjectHandler:^id(NSDictionary *routerParameters) {
        NSString *type = routerParameters[@"type"];
        if([type isEqualToString:@"1"]) {
            NSString *v = [UIDevice currentDevice].systemVersion ? : @"";
            return @{@"version": v};
        }
        else if([type isEqualToString:@"2"]) {
            NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
            NSString *v = [info objectForKey:@"CFBundleShortVersionString"] ? : @"";
            NSString *b = [info objectForKey:@"CFBundleVersion"] ? : @"";
            return @{@"version": v, @"build": b};
        }
        return @{};
    }];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
