//
//  DragItemCollectionController.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/9.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "DragItemCollectionController.h"
#import "Utils.h"
#import "DragCollectionViewCell.h"

@interface DragItemCollectionController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;

@end

@implementation DragItemCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"拖动重新布局";
    self.dataList = [NSMutableArray arrayWithArray:@[@"大衣",@"衬衫",@"T-shirt",@"配饰",@"学院风",@"都市风", @"卫衣",@"长裙"]];
    //
    [self setupCollectionView];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64.0, kWIDTH, kHEIGHT - 64.0) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
    //register cell
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DragCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"DragCollectionViewCell"];
    //给collectionView 添加一个手势
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMove:)];
    [_collectionView addGestureRecognizer:_longPress];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DragCollectionViewCell *dragCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DragCollectionViewCell" forIndexPath:indexPath];
    [dragCell configCellWithTitle:_dataList[indexPath.row]];

    return dragCell;
}

#pragma mark - UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSIndexPath *selectedIndexPath = [_collectionView indexPathForItemAtPoint:[_longPress locationInView:_collectionView]];
    //当前cell
    DragCollectionViewCell *dragCell = [_collectionView cellForItemAtIndexPath:selectedIndexPath];
    //cell操作
//    dragCell.
    [self.dataList exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kWIDTH-2)/3.0, kWIDTH/3.0);
}

#pragma mark - Actions
- (void)longPressMove:(UILongPressGestureRecognizer *)longGesture {
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:{
            NSIndexPath *selectedIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:_collectionView]];
            DragCollectionViewCell *cell = [_collectionView cellForItemAtIndexPath:selectedIndexPath];
            //隐藏cell
//            cell操作
            [_collectionView beginInteractiveMovementForItemAtIndexPath:selectedIndexPath];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            [_collectionView updateInteractiveMovementTargetPosition:[_longPress locationInView:longGesture.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [_collectionView endInteractiveMovement];
            break;
        }
        default:
            [_collectionView cancelInteractiveMovement];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
