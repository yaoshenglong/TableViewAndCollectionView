//
//  SenceSortCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "SenceSortCell.h"
#import "SenceItemCollectionCell.h"
#import "Utils.h"

static NSString *kSenceItemCollectionCell = @"SenceItemCollectionCell";
static CGFloat titleViewH = 44.0;
static CGFloat padding = 12.0;

@interface SenceSortCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SenceSortCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //registerCell
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SenceItemCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:kSenceItemCollectionCell];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.text = @"场景分类";
    [_collectionView reloadData];
}

//model里面后台返回了图片的宽高 计算高度要使用宽高比例
+ (CGFloat)cellHeightWithModel:(NSDictionary *)dict {
    return titleViewH + padding * 2 + (72.0/120.0) * (kWIDTH/2.5-10) + 1.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%ld个Item", indexPath.row);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSouce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SenceItemCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSenceItemCollectionCell forIndexPath:indexPath];
    [cell configCellWithImgUrl:_dataSouce[indexPath.row]];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 72.0 / 120.0 是图片的宽高比例
    return CGSizeMake(kWIDTH/2.5, (kWIDTH/2.5-10) *(72.0/120.0));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
