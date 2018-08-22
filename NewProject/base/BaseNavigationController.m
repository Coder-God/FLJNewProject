//
//  BaseNavigationController.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Color.h"

@implementation BaseNavigationController

//APP生命周期中 只会执行一次
+ (void)initialize{
    
    //隐藏返回按钮文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    //导航栏背景图
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forBarMetrics:UIBarMetricsDefault];
    //如果设置了 BackgroundImage，则BarTintColor不起作用
    [navBar setBarTintColor:[UIColor whiteColor]];
    //item 颜色
    [navBar setTintColor:[UIColor whiteColor]];
    //iOS11之前 用来去掉 导航栏下面的分割线   iOS11之后默认没有分割线了
    [navBar setShadowImage:[UIImage new]];
//    navBar.translucent = NO;
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:22]}];
    
    //导航栏左右文字主题
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
