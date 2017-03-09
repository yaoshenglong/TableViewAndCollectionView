//
//  DragCollectionViewCell.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/9.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "DragCollectionViewCell.h"

@interface DragCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation DragCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configCellWithTitle:(NSString *)titleString {
    _titleLabel.text = titleString;
}

@end
