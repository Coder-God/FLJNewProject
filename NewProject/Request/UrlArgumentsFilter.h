//
//  UrlArgumentsFilter.h
//  Taekwondo
//
//  Created by 贾林飞 on 2018/1/29.
//  Copyright © 2018年 moto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKRequest.h>
#import "YTKNetworkConfig.h"

@interface UrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+ (UrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;

@end
