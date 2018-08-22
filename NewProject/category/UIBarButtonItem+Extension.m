//
//  UIBarButtonItem+Extension.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)creatNavigationBarItemWithImageName:(NSString*)imageName target : (UIViewController *)target selector: (SEL)selector{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.size = btn.imageView.image.size;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    //解决导航栏 按钮点击范围过大的问题 用一个view包起来
    UIView* caontainerView = [[UIView alloc] initWithFrame:btn.bounds];
    [caontainerView addSubview:btn];
    
    UIBarButtonItem* barItem = [[UIBarButtonItem alloc] initWithCustomView:caontainerView];
    return barItem;
}

+(instancetype)creatNavigationBarItemWithText:(NSString *)text target:(UIViewController *)target selector:(SEL)selector{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = kFont(18);
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat width = [text widthForFont:kFont(18)]+5;
    width = width<44?44:width;
    btn.frame = CGRectMake(0, 0, width, 22);

    //解决导航栏 按钮点击范围过大的问题 用一个view包起来
    UIView* caontainerView = [[UIView alloc] initWithFrame:btn.bounds];
    [caontainerView addSubview:btn];
    
    UIBarButtonItem* barItem = [[UIBarButtonItem alloc] initWithCustomView:caontainerView];
    return barItem;
}
@end
