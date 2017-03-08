//
//  ProductCollectionCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "ProductCollectionCell.h"

@interface ProductCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation ProductCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configCellWithModel:(NSDictionary *)dict {
    self.titleLabel.text = @"测试主标题";
    self.subTitleLabel.text = @"测试副标题";
}

@end
