//
//  BaseTabBarController.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "TabBar.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "CartViewController.h"
#import "MineViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    
    [self addOneChildViewController:[[HomeViewController alloc]init] title:@"home" normalImage:@"btn-sy-n" selectedImage:@"btn-sy-h"];
    [self addOneChildViewController:[[ClassifyViewController alloc]init] title:@"classify" normalImage:@"btn-fl-n" selectedImage:@"btn-fl-h"];
    [self addOneChildViewController:[[CartViewController alloc]init] title:@"cart" normalImage:@"btn-gwc-n" selectedImage:@"btn-gwc-h"];
    [self addOneChildViewController:[[MineViewController alloc]init] title:@"mine" normalImage:@"btn-wd-n" selectedImage:@"btn-wd-h"];
    
    TabBar* tabBar = [[TabBar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];

}

-(void)addOneChildViewController:(UIViewController*)viewController title:(NSString*)title normalImage:(NSString*)normalImage selectedImage:(NSString*)selectedImage{
    viewController.title = title;
    viewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self addChildViewController:[[BaseNavigationController alloc]initWithRootViewController:viewController]];
    
}
@end
