//
//  HotItemCollectionCell.h
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotItemCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbImgView;

//如果这里需要传model 就改成相应的model
- (void)configCellWithString:(NSString *)imgUrlString
                   withIndex:(NSInteger)index;

@end
