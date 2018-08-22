//
//  BaseTableViewCell.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
