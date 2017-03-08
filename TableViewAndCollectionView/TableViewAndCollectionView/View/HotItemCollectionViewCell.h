//
//  HotItemCollectionViewCell.h
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSArray *dataSource;//数据

//这里可以换成具体的model
+ (CGFloat)cellHeightWithItemCount:(NSInteger)count;

@end
