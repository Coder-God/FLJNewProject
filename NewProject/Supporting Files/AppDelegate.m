//
//  AppDelegate.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import <YTKNetwork.h>
#import "UrlArgumentsFilter.h"
#import <IQKeyboardManager.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BaseTabBarController* tabBarController = [[BaseTabBarController alloc]init];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    [self configureNetWork];
    [self configureIQKeyboard];
    [self removeTmpCacheData];

    return YES;
}

#pragma mark 网络配置
-(void)configureNetWork
{
    YTKNetworkConfig *networkConfig=[YTKNetworkConfig sharedConfig];
    networkConfig.baseUrl =kBaseUrl;
    [networkConfig clearUrlFilter];
    //添加公共参数
//    if (![FLJUtil isBlankString:kGetToken]) {
//        UrlArgumentsFilter *urlFilter = [UrlArgumentsFilter filterWithArguments:@{@"Token":kGetToken,@"version":kBundleVersion}];
//        [networkConfig addUrlFilter:urlFilter];
//    }else
//    {
//        UrlArgumentsFilter *urlFilter = [UrlArgumentsFilter filterWithArguments:@{@"version":kBundleVersion}];
//        [networkConfig addUrlFilter:urlFilter];
//    }
    
}

#pragma mark 键盘
-(void)configureIQKeyboard
{
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

#pragma mark  private

-(void)removeTmpCacheData
{
    NSString* path = NSTemporaryDirectory();
    
    NSFileManager* manager = [NSFileManager defaultManager];
    NSArray* subFiles = [manager contentsOfDirectoryAtPath:path error:nil];
    if (subFiles) {
        for (NSString* string in subFiles) {
            NSString* pathString = [path stringByAppendingString:string];
            if ([manager fileExistsAtPath:pathString]) {
                NSError* error = nil;
                [manager removeItemAtPath:pathString error:&error];
                if (error) {
                    NSLog(@"%@",error);
                }
            }
        }
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
