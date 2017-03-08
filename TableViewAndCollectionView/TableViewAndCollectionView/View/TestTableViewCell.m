//
//  TestTableViewCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "TestTableViewCell.h"
#import "HotItemCollectionCell.h"
#import "Utils.h"

static NSString *const kHotItemCollectionCell = @"HotItemCollectionCell";

static CGFloat titleViewHeight = 44.0;//顶部titleView 高度
static CGFloat padding = 12.0;

@interface TestTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TestTableViewCell

/**
 * 项目要求1、当cell的个数超过8个的时候 纵向布局并且 第5列的cell要漏出半个（提示可以滑动）
 *        2、当cell的个数少于8个的时候 横向布局
 *        3、当cell的个数少于等于4个的时候显示一行
 */

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //将collectionView的代理写在这里 cell重用的话这里只会执行一次
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //register cell
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HotItemCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:kHotItemCollectionCell];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    //布局或者重新渲染的数据放在这里
    self.flowLayout.scrollDirection = (_dataSource.count > 8) ? UICollectionViewScrollDirectionHorizontal :UICollectionViewScrollDirectionVertical;
    //只是显示的表现出布局
    self.titleLabel.text = (_dataSource.count > 8) ? @"纵向布局" : @"横向布局";
    [_collectionView reloadData];
}

//根据item的个数计算cell的高度
+ (CGFloat)cellHeightWithItemCount:(NSInteger)itemCount {
    if (itemCount > 8) {
        return titleViewHeight + padding * 2 + (kWIDTH / 4.5 * 2) + 10.0;
    }
    else if (itemCount <= 4){
        //单排
        return titleViewHeight + padding * 2 + kWIDTH/4.0 + 2.0;
    }
    else {
        return titleViewHeight + padding * 2 + (kWIDTH/4.0) * 2 + 10.0;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotItemCollectionCell *itemCell = [collectionView dequeueReusableCellWithReuseIdentifier:kHotItemCollectionCell forIndexPath:indexPath];
    [itemCell configCellWithString:_dataSource[indexPath.row]
                         withIndex:indexPath.row];
    return itemCell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%ld个cell", indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataSource.count > 8) {
        //        要显示第5个的一半
        return CGSizeMake(kWIDTH /4.5, kWIDTH /4.5);
    }
    else if (_dataSource.count < 4) {

        return CGSizeMake(kWIDTH / 4.0, kWIDTH / 4.0);
    }
    else {
        return CGSizeMake(kWIDTH / 4.0, kWIDTH / 4.0);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
