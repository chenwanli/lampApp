//
//  TimerAddVC.h
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol timerAddVCDelegate <NSObject>

- (void)timerAddVCDelegateReturn;

@end

@interface TimerAddVC : UIViewController<UITableViewDataSource,UITableViewDelegate,cwlAlertViewDelegate>{
    NSInteger _openRow;
    NSInteger _isOpenRow;
}
@property(nonatomic,assign)id <timerAddVCDelegate> delegate;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DataStorage *dataStorage;
@property(nonatomic,strong)DelayTaskData *delayTaskData;
@end
