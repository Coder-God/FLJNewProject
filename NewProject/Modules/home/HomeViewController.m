//
//  HomeViewController.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "HomeViewController.h"
#import "MineViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "BaseNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface HomeViewController ()

@property (strong, nonatomic)UIButton* pushBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.fd_prefersNavigationBarHidden = YES;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithText:@"跳转" target:self selector:@selector(pushBtnDidClicked)];

    self.pushBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.centerX, self.view.centerY, 100, 50)];
    [self.pushBtn setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.pushBtn addTarget:self action:@selector(pushBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pushBtn];
    
//    [self setStatusBarBackgroundColor:[UIColor orangeColor]];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"首页";
}

-(void)pushBtnDidClicked
{
    MineViewController* vc = [[MineViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
