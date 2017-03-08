//
//  HotItemCollectionCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "HotItemCollectionCell.h"

@interface HotItemCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemIndexLabel;
@end

@implementation HotItemCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//如果这里需要传model 就改成相应的model
- (void)configCellWithString:(NSString *)imgUrlString
                   withIndex:(NSInteger)index {
    self.itemIndexLabel.text = [NSString stringWithFormat:@"%ld", index];
    //这里 正真的数据可以使用SDWebImage的方法
//    self.thumbImgView.image = [UIImage imageNamed:imgUrlString];
}

@end
