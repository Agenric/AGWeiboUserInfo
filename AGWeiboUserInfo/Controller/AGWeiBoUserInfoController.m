//
//  AGWeiBoUserInfoController.m
//  AGWeiboUserInfo
//
//  Created by Agenric on 15/10/8.
//  Copyright (c) 2015年 Agenric. All rights reserved.
//


#define kTableViewHeaderDefH    200
#define kTableViewHeaderMinH    64
#define kTableViewTabH          44

#import "AGWeiBoUserInfoController.h"
#import "UIImage+Color.h"

@interface AGWeiBoUserInfoController ()<UITableViewDataSource, UITableViewDelegate>
{
    CGFloat _defaultOffsetY;
}
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation AGWeiBoUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableView Datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"myIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor redColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark - setupUI
- (void)setupUI {
    // tableView
    _defaultOffsetY = -(kTableViewHeaderDefH + kTableViewTabH);
    [self.mainTableView setContentInset:UIEdgeInsetsMake(-_defaultOffsetY, 0, 0, 0)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.mainTableView setTableFooterView:[[UIView alloc] init]];
    
    // navigationBar
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    // title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Agenric";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    _titleLabel = titleLabel;
    _titleLabel.alpha = 0;
    _titleLabel.hidden = YES;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat delta = offsetY - _defaultOffsetY;
    
    CGFloat height = kTableViewHeaderDefH - delta;
    
    NSLog(@"offsetY----%f",offsetY);
    NSLog(@"delta------%f",delta);
    NSLog(@"height-----%f",height);
    if (height < kTableViewHeaderMinH) {
        height = kTableViewHeaderMinH;
    }
    _tableViewHeaderH.constant = height;
    
    CGFloat alpha = delta / (kTableViewHeaderDefH - kTableViewHeaderMinH);
    if (alpha > 0) {
        _titleLabel.hidden = NO;
        if (alpha >= 1) {
            alpha = 0.99;
        }
    } else {
        _titleLabel.hidden = YES;
    }
    
    _titleLabel.alpha = alpha;
    
    // 设置导航条的背景图片
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
@end
