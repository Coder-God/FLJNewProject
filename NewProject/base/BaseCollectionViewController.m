//
//  BaseCollectionViewController.m
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
}

#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray* array = [self.dataSource objectOrNilAtIndex:section];
    return array.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kScreenWidth, kItemHeight);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.f;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}

//-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    cell.layer.cornerRadius = 5.f;
//    cell.layer.masksToBounds = YES;
//    cell.layer.borderWidth = .5f;
//    cell.layer.borderColor = kGrayLineColor.CGColor;
//}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BaseCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BaseCollectionViewCell" forIndexPath:indexPath];
    
    [cell configureDataWithDataModel:[[self.dataSource objectOrNilAtIndex:indexPath.section] objectOrNilAtIndex:indexPath.item]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(kScreenWidth, 60);
    }else
    {
        return CGSizeMake(kScreenWidth, 30);
    }
}

//-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if (kind == UICollectionElementKindSectionHeader) {
//        if (indexPath.section == 0) {
//            UnsignInCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UnsignInCollectionReusableView" forIndexPath:indexPath];
//            [view configureDataWithDataModel:self.lessonModel];
//            return view;
//        }else
//        {
//            SignInCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SignInCollectionReusableView" forIndexPath:indexPath];
//            return view;
//        }
//    }
//    return nil;
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}


#pragma mark  system

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark  private

#pragma mark getter&setter

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - KNavgationHight) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
    }
    return _collectionView;
}

@end
