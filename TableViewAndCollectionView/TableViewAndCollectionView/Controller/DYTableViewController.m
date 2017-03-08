//
//  DYTableViewController.m
//  TableViewAndCollectionView
//
//  Created by 姚胜龙 on 17/3/7.
//  Copyright © 2017年 姚胜龙. All rights reserved.
//

#import "DYTableViewController.h"
#import "TestTableViewCell.h"
#import "SenceSortCell.h"
#import "Utils.h"

static NSString *const kTestTableViewCell = @"TestTableViewCell";
static NSString *const kSenceSortCell = @"SenceSortCell";
static CGFloat kNavigationH = 64.0;
static CGFloat kSectionFooterH = 20.0;

@interface DYTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation DYTableViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CollectionViewInTableViewCellDemo";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    _dataSource = [NSMutableArray arrayWithArray:@[
              @[@"item1",@"item2",@"item3",@"item4",
                @"item5",@"item6",@"item7",@"item8",
                @"item9",@"item10",@"item11",@"item12",
                @"item13",@"item14",@"item15",@"item16"],

              @[@"item1",@"item2",@"item3",@"item4",
                @"item5",@"item6",@"item7"],
              @[@"banner1",@"banner2",@"banner3",@"banner4",
                @"banner5"]
              ]];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationH, kWIDTH, kHEIGHT - kNavigationH) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    //register cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TestTableViewCell class]) bundle:nil] forCellReuseIdentifier:kTestTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SenceSortCell class]) bundle:nil] forCellReuseIdentifier:kSenceSortCell];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestTableViewCell];
        cell.dataSource = _dataSource[indexPath.section];
        return cell;
    }
    else if (indexPath.section == 1) {
        TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestTableViewCell];
        cell.dataSource = _dataSource[indexPath.section];
        return cell;
    }
    else if (indexPath.section == 2) {
        SenceSortCell *sortCell = [tableView dequeueReusableCellWithIdentifier:kSenceSortCell];
        sortCell.dataSouce = _dataSource[indexPath.section];
        return sortCell;
    }

    return nil;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSArray *itemSource = (NSArray *)_dataSource[indexPath.row];
        return [TestTableViewCell cellHeightWithItemCount:itemSource.count];
    }
    else if (indexPath.section == 1) {
        NSArray *itemSource = (NSArray *)_dataSource[indexPath.row];
        return [TestTableViewCell cellHeightWithItemCount:itemSource.count];
    }
    else if (indexPath.section == 2) {
        return [SenceSortCell cellHeightWithModel:@{}];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kSectionFooterH;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kSectionFooterH)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - UITableViewDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
