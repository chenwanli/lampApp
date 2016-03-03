//
//  CWLAlert.h
//  提示框
//
//  Created by 陈万里 on 15/10/16.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol cwlAlertViewDelegate <NSObject>
@optional
- (void)alertView:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@interface CWLAlert : NSObject

@property(nonatomic,strong)id <cwlAlertViewDelegate> delegate;

- (id)initAlertTitle:(NSString *)Title message:(NSString *)message titleBtn:(NSString *)titleBtn otherBtn:(NSString *)otherBtn VC:(UIViewController *)vc;

+(void)alertTitle:(NSString *)Title message:(NSString *)message titleBtn:(NSString *)titleBtn otherBtn:(NSString *)otherBtn VC:(UIViewController *)vc;

@end
