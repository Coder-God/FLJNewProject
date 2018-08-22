//
//  BaseView.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/21.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    
}

-(void)configureDataWithDataModel:(id)dataModel{
    
    if (!dataModel) {
        return;
    }
    
    [self layoutIfNeeded];
    [self setNeedsLayout];

}

-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
