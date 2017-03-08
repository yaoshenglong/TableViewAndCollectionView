//
//  SectionHeaderCollectionCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "SectionHeaderCollectionCell.h"

@implementation SectionHeaderCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.text = @"商品战表";
}

- (IBAction)showAllProductView:(id)sender {

    NSLog(@"进入全部商品列表");
}

@end
