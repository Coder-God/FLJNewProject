//
//  BaseCollectionViewController.h
//  NewProject
//
//  Created by 贾林飞 on 2018/8/22.
//  Copyright © 2018年 贾林飞. All rights reserved.
//

#import "BaseViewController.h"

#define  kItemHeight 60

@interface BaseCollectionViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView* collectionView;

@property(nonatomic,strong)NSMutableArray* dataSource;

@end
