//
//  BaseViewController.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIBarButtonItem+Extension.h"
#import <SDImageCache.h>
#import <SDWebImageManager.h>

@interface BaseViewController ()


@end

static BOOL SDImagedownloderOldShouldDecompressImages = YES;

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.clipsToBounds = YES;
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.fd_prefersNavigationBarHidden = NO;
    self.fd_interactivePopDisabled = NO;
    self.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = 30;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    //隐藏系统返回按钮
    self.navigationItem.hidesBackButton = YES;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)){
            [[UIScrollView appearanceWhenContainedInInstancesOfClasses:@[[UIViewController class]]] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
    });
}

#pragma mark  private

-(void)creatBackBtn{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithImageName:@"icon_back" target:self selector:@selector(onClickBackBarButtonItem)];
}

-(void)creatLeftBarButtonItemWithText:(NSString*)text{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithText:text target:self selector:@selector(onClickLeftBarButtonItem)];
}

-(void)creatLeftBarButtonItemWithImageName:(NSString*)imageName{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithImageName:imageName target:self selector:@selector(onClickLeftBarButtonItem)];
}

-(void)creatRightBarButtonItemWithText:(NSString*)text{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithText:text target:self selector:@selector(onClickRightBarButtonItem)];
}

-(void)creatRightBarButtonItemWithImageName:(NSString*)imageName{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem creatNavigationBarItemWithImageName:imageName target:self selector:@selector(onClickRightBarButtonItem)];
}

-(void)onClickBackBarButtonItem{
    if (self.presentingViewController) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else
        [self.navigationController popViewControllerAnimated:YES];
}

-(void)onClickLeftBarButtonItem{
    [self onClickLeftBarButtonItem];
}

-(void)onClickRightBarButtonItem{
    
}

- (void)setStatusBarBackgroundColor:(UIColor*)color {
    UIView*statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

#pragma mark system

- (BOOL)prefersStatusBarHidden{
    return NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)loadView{
    [super loadView];
    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
    SDImagedownloderOldShouldDecompressImages = downloder.shouldDecompressImages;
    downloder.shouldDecompressImages = NO;
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
    downloder.shouldDecompressImages = SDImagedownloderOldShouldDecompressImages;
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    NSLog(@"=======didReceiveMemoryWarning==========");
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache]clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    [[SDWebImageManager sharedManager]cancelAll];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationItem.hidesBackButton = YES;
//}
//
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.navigationItem.hidesBackButton = YES;
//}

@end
