//
//  NSString+UrlUtils.m
//  Taekwondo
//
//  Created by 贾林飞 on 2018/1/29.
//  Copyright © 2018年 moto. All rights reserved.
//

#import "NSString+UrlUtils.h"
#import <AFNetworking/AFNetworking.h>

@implementation NSString (UrlUtils)

- (NSString *)stringByAppendURLParameters:(NSDictionary *)parameters {
    NSString *paraUrlString = AFQueryStringFromParameters(parameters);
    
    if (!(paraUrlString.length > 0)) {
        return self;
    }
    
    BOOL useDummyUrl = NO;
    static NSString *dummyUrl = nil;
    NSURLComponents *components = [NSURLComponents componentsWithString:self];
    if (!components) {
        useDummyUrl = YES;
        if (!dummyUrl) {
            dummyUrl = kBaseUrl;
        }
        components = [NSURLComponents componentsWithString:dummyUrl];
    }
    
    NSString *queryString = components.query ?: @"";
    NSString *newQueryString = [queryString stringByAppendingFormat:queryString.length > 0 ? @"&%@" : @"%@", paraUrlString];
    components.query = newQueryString;
    if (useDummyUrl) {
        return [components.URL.absoluteString substringFromIndex:dummyUrl.length - 1];
    } else {
        return components.URL.absoluteString;
    }
}

@end
