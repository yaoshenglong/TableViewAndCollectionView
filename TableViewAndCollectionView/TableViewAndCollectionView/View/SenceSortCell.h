//
//  SenceSortCell.h
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SenceSortCell : UITableViewCell

@property (nonatomic, strong) NSArray *dataSouce;//数据

//model里面后台返回了图片的宽高 计算高度要使用宽高比例
+ (CGFloat)cellHeightWithModel:(NSDictionary *)dict;

@end
