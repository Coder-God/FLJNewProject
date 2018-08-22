//
//  TabBar.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()

@property (strong, nonatomic)UIButton* middleBtn;

@end

@implementation TabBar

-(instancetype)init{
    if (self == [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.middleBtn = [[UIButton alloc]init];
        [self.middleBtn setImage:[UIImage imageNamed:@"icon_add_tag"] forState:UIControlStateNormal];
        [self.middleBtn setImage:[UIImage imageNamed:@"icon_add_tag"] forState:UIControlStateHighlighted];

        [self.middleBtn addTarget:self action:@selector(middleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.middleBtn];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat height = self.bounds.size.height;
    if (kDevice_Is_iPhoneX) {
        if (@available(iOS 11.0, *)) {
            height -= self.safeAreaInsets.bottom;
        } else {
            // Fallback on earlier versions
        }
    }
    
    CGFloat itemWidth = kScreenWidth/(self.items.count+1);
    for (int i = 0; i<self.subviews.count; i++) {
        UIView* subView = self.subviews[i];
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i < 4) {
                subView.frame = CGRectMake((i - 2) * itemWidth, 0, itemWidth, height);
            }else
            {
                subView.frame = CGRectMake((i - 1) * itemWidth, 0, itemWidth, height);
            }
        }
    }
    
    self.middleBtn.frame = CGRectMake(itemWidth*2, 0, itemWidth, height);
}

- (void)middleBtnClick{
    NSLog(@"middleBtnClick");
}

@end
