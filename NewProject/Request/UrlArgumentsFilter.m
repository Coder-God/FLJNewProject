//
//  UrlArgumentsFilter.m
//  Taekwondo
//
//  Created by 贾林飞 on 2018/1/29.
//  Copyright © 2018年 moto. All rights reserved.
//

#import "UrlArgumentsFilter.h"
#import "NSString+UrlUtils.h"

@interface UrlArgumentsFilter ()

@property (strong, nonatomic)NSDictionary* arguments;

@end

@implementation UrlArgumentsFilter

+ (UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return  [originUrl stringByAppendURLParameters:_arguments];
}

@end
