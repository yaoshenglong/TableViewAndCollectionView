//
//  TestTableViewCell.h
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataSource;

//计算cell高度的方法
+ (CGFloat)cellHeightWithItemCount:(NSInteger)itemCount;

@end
