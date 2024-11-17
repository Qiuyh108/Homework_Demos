//
//  AppDelegate.m
//  ECID
//
//  Created by 邱耀辉 on 2024/11/2.
//

#import <IOKit/IOKitLib.h>
#import <CoreFoundation/CoreFoundation.h>
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)ecid {
    io_service_t service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
    if (service == MACH_PORT_NULL) {
        return;
    }
    
    CFTypeRef ecid = IORegistryEntryCreateCFProperty(service, CFSTR("IOPlatformUUID"), kCFAllocatorDefault, 0);
    if (ecid) {
        NSString *ecidString = (__bridge_transfer NSString *)ecid;
        IOObjectRelease(service);
        NSLog(@"ecid = .%@", ecidString);
    }
    
    IOObjectRelease(service);
//    return nil;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
