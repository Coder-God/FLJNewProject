//
//  BaseTableViewCell.h
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

-(void)setupSubViews;

-(void)configureDataWithDataModel:(id)dataModel;

@end
