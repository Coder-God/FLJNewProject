//
//  NSString+UrlUtils.h
//  Taekwondo
//
//  Created by 贾林飞 on 2018/1/29.
//  Copyright © 2018年 moto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UrlUtils)

- (NSString *)stringByAppendURLParameters:(NSDictionary *)parameters;

@end
