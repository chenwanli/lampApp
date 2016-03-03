//
//  DelayTaskData.h
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DelayTaskData : NSObject
+ (instancetype)sharedManager;
@property(nonatomic,strong)NSMutableArray *userDataArray;

@property(nonatomic,copy)NSString *date;//操作时间
@property(nonatomic,copy)NSString *delayDete;//延时时间
@property(nonatomic,copy)NSString *delayDeteShow;//延时时间
@property(nonatomic,copy)NSString *beforeAndAfter;//后开启  后关闭
@property(nonatomic,copy)NSString *isOpen;//是否开启
@property(nonatomic,copy)NSString *timeDelay;//0定时 1延时

- (void)getuserDataPathStr:(NSString *)pathStr;

- (void)saveUserDataPathStr:(NSString *)pathStr;
@end
