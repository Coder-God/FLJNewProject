//
//  UIImage+Color.m
//  NewProject
//
//  Created by 贾林飞 on 2017/12/5.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+(UIImage*)imageWithColor:(UIColor*)color{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), YES, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, 1, 1));
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
