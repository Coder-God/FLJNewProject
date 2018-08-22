//
//  UIBarButtonItem+Extension.h
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)creatNavigationBarItemWithImageName:(NSString*)imageName target : (UIViewController *)target selector: (SEL)selector;

+ (instancetype)creatNavigationBarItemWithText:(NSString*)text target : (UIViewController *)target selector: (SEL)selector;


@end
