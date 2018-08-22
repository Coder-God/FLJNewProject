//
//  BaseCollectionReusableView.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseCollectionReusableView.h"

@implementation BaseCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

-(void)configureDataWithDataModel:(id)dataModel{
    if (!dataModel) {
        return;
    }
}

-(void)setupSubViews{
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
