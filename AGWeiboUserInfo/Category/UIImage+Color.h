//
//  UIImage+Color.h
//  
//
//  Created by Agenric on 15/10/8.
//  Copyright (c) 2015年 Agenric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImage)
// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
