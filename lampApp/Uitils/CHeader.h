//
//  CHeader.h
//  GWg-mall
//
//  Created by 陈万里 on 15/6/30.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#ifndef GWg_mall_CHeader_h
#define GWg_mall_CHeader_h

#define _RSA_ @"ios_public_key"

#define HTTPServer_1 @"http://gx.gnet-mall.com/"

// 获取屏幕高度
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
// 获取屏幕宽度
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES:NO)

//RGB颜色
#define RGB_A(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define FONT(font) [UIFont systemFontOfSize:font]
#define IMG(str) [UIImage imageNamed:str];

//延迟消失的提示框
#define UIAlert(a,b,c,d) UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:a delegate:nil cancelButtonTitle:b otherButtonTitles:c, nil];\
[alertView show];\
dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, d * NSEC_PER_SEC);\
dispatch_after(popTime, dispatch_get_main_queue(), ^(void){\
    [alertView dismissWithClickedButtonIndex:0 animated:YES];\
});

//有代理的提示框
#define UIAlertDelegate(a,b,c,d,e) UIAlertView *alertViewDelegate = [[UIAlertView alloc]initWithTitle:nil message:a delegate:b cancelButtonTitle:c otherButtonTitles:d, nil];\
alertViewDelegate.tag = e;\
[alertViewDelegate show];\




#import "UIView+Auxiliary.h"
#import "ControlsToCreate.h"
#import "UIViewController+Transit.h"

#import "MBProgressHUD.h"
#import "CWLAlert.h"
#import "CWLtool.h"
#import "CwlEncapsulation.h"

#import "DataStorage.h"
#import "DelayTaskData.h"
#import "DataObject.h"
#import "UARTPeripheral.h"
#endif
