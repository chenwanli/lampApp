//  添加延时
//  DelayListVC.h
//  lampApp
//
//  Created by CaiKetao on 15/12/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelayListCell.h"
#import "TimerAddVC.h"
@protocol DelayListVCDelegate <NSObject>

- (void)delayListVCDelegate:(DelayTaskData *)delayTaskData type:(NSInteger)type;

@end

@interface DelayListVC : UIViewController<UITableViewDataSource,UITableViewDelegate,timerAddVCDelegate,delayListCellDelegate>
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,assign)id <DelayListVCDelegate> delegate;
@property(nonatomic,strong)DataStorage *dataStorage;//设备名
@property(nonatomic,strong)DelayTaskData *delayTaskData;//保存延时定时的数据
@property(nonatomic,assign)BOOL isOpen;
@end
