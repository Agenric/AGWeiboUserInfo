//
//  AGWeiBoUserInfoController.h
//  AGWeiboUserInfo
//
//  Created by Agenric on 15/10/8.
//  Copyright (c) 2015年 Agenric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGWeiBoUserInfoController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *tableViewHeader;
@property (weak, nonatomic) IBOutlet UIImageView *tableViewHeaderBg;
@property (weak, nonatomic) IBOutlet UIView *tableViewTab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeaderH;

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@end
