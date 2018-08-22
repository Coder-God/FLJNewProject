//
//  BaseViewController.h
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)creatBackBtn;

-(void)creatLeftBarButtonItemWithText:(NSString*)text;

-(void)creatLeftBarButtonItemWithImageName:(NSString*)imageName;

-(void)creatRightBarButtonItemWithText:(NSString*)text;

-(void)creatRightBarButtonItemWithImageName:(NSString*)imageName;

-(void)onClickBackBarButtonItem;

-(void)onClickLeftBarButtonItem;

-(void)onClickRightBarButtonItem;

/**
 修改状态栏背景色 全局

 @param color UIColor
 */
- (void)setStatusBarBackgroundColor:(UIColor*)color;

@end
