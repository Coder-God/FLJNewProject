//
//  BaseTableViewController.m
//  NewProject
//
//  Created by 贾林飞 on 2017/5/31.
//  Copyright © 2017年 贾林飞. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseClassNameModel.h"

@interface BaseTableViewController ()

@property(nonatomic,assign)UITableViewStyle style;

@end

@implementation BaseTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super init]) {
        _style = style;
        self.style = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseClassNameModel* model = [self.dataSource objectOrNilAtIndex:indexPath.row];
    if (model.cellHeight>0) {
        return model.cellHeight;
    }
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .001f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .001f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseClassNameModel* model = [self.dataSource objectOrNilAtIndex:indexPath.row];
    if (!model.cellHeight || model.cellHeight != cell.height) {
        model.cellHeight = cell.height;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* reusedID = @"UITableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedID];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark private

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - KNavgationHight) style:self.style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = kBackgroundColor;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kTabBarHeight)];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSArray alloc] init];
    }
    return _dataSource;
}

@end
