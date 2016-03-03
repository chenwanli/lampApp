//
//  UIViewController+Transit.h
//  GWhome
//
//  Created by 陈万里 on 15/9/24.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Transit)
- (void)homeVC;
- (void)loginVC;
- (UIView *)setNavigationBarTiti:(NSString *)titi leftImg:(NSString *)imgStr;

- (UIView *)setNavigationBarOrSo:(NSString *)titi leftImg:(NSString *)imgStr rightImg:(NSString *)rightImgStr;

@end
