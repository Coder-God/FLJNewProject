//
//  BaseRequest.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/21.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

//设置请求头
//-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary
//{
//    NSString* serviceVersion = [[NSUserDefaults standardUserDefaults]objectForKey:kServiceVersion];
//    if (![FLJUtil isBlankString:serviceVersion]) {
//        return @{@"APP-VERSION":serviceVersion,@"platform":@"ios"};
//    }
//    return @{@"platform":@"ios"};
//}

-(NSInteger)cacheTimeInSeconds
{
    return 0;
}

-(YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}


-(NSTimeInterval)requestTimeoutInterval
{
    return 60.f;
}

@end
