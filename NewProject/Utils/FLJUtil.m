//
//  FLJUtil.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/17.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "FLJUtil.h"

@implementation FLJUtil

//判断字符串为空
+(BOOL) isBlankString:(NSString *)string {
    
    if ([string isKindOfClass:[NSNumber class]]) {
        NSNumber* number = (NSNumber*)string;
        string = number.stringValue;
    }
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
