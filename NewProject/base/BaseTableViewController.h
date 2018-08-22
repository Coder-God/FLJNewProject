//
//  BaseTableViewController.h
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray* dataSource;

@property(nonatomic,strong)UITableView* tableView;

-(instancetype)initWithStyle:(UITableViewStyle)style;

@end
