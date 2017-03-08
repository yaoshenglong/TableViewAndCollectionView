//
//  ViewController.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "MainViewController.h"
#import "DYTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//table
- (IBAction)showTableView:(UIButton *)sender {
    DYTableViewController *dyTableVC = [[DYTableViewController alloc] init];
    [self.navigationController pushViewController:dyTableVC animated:YES];
}

//collection
- (IBAction)showCollectionView:(id)sender {
}
//header
- (IBAction)showCollectionHeaderView:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
