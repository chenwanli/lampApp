//
//  UIView+Auxiliary.h
//  GWOrder
//
//  Created by 陈万里 on 15/6/2.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Auxiliary)

- (float)height;
- (float)width;
- (float)x;
- (float)y;
- (float)totalHeigth;
- (float)totalwidth;
@property(nonatomic,assign)float cwlRounded;
@property(nonatomic,assign)float cwlBorder;//边框
@end
