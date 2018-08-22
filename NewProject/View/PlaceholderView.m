//
//  PlaceholderView.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "PlaceholderView.h"

@interface PlaceholderView ()

@property(nonatomic,strong)UIView* containerView;

@property(nonatomic,strong)UIImageView* iconView;

@property(nonatomic,strong)UILabel* describeLabel;

@end

@implementation PlaceholderView

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName describe:(NSString *)describe{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
        self.iconView.image = kImageNamed(imageName);
        self.describeLabel.text = describe;
    }
    return self;
}

-(void)setupSubViews{
    self.containerView = [[UIView alloc] init];
    
    self.iconView = [[UIImageView alloc] init];
    
    self.describeLabel = [[UILabel alloc] init];
    self.describeLabel.font = kFont(15);
    self.describeLabel.textColor = kGrayColor;
    self.describeLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.iconView];
    [self.containerView addSubview:self.describeLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [self.describeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).offset(10);
        make.left.equalTo(self.containerView.mas_left);
        make.right.equalTo(self.containerView.mas_right);
    }];
}

@end
