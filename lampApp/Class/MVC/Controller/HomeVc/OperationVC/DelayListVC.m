//  添加延时
//  DelayListVC.m
//  lampApp
//
//  Created by CaiKetao on 15/12/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "DelayListVC.h"

@interface DelayListVC ()

@end

@implementation DelayListVC

- (void)timerAddVCDelegateReturn{
    [_delayTaskData getuserDataPathStr:[NSString stringWithFormat:@"%@_%ld",_dataStorage.peripheralName,_type]];
    DelayTaskData *delay = _delayTaskData.userDataArray[_delayTaskData.userDataArray.count - 1];
    [self.delegate delayListVCDelegate:delay type:_type];
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNavigationBarOrSo:@[@"定时列表",@"延时列表"][_type] leftImg:@"barbuttonicon_back" rightImg:@"barbuttonicon_add"];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    _delayTaskData = [DelayTaskData sharedManager];
    [_delayTaskData getuserDataPathStr:[NSString stringWithFormat:@"%@_%ld",_dataStorage.peripheralName,_type]];
    
    if (_isOpen) {
        for (DelayTaskData *delay in _delayTaskData.userDataArray) {
            delay.isOpen = @"0";
        }
    }
    [_delayTaskData saveUserDataPathStr:[NSString stringWithFormat:@"%@_%ld",_dataStorage.peripheralName,_type]];

    [self uiCreate];
}

- (void)uiCreate{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _delayTaskData.userDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DelayListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DelayListCell"];
    if (!cell) {
        cell = [[DelayListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DelayListCell"];
        cell.delegate = self;
    }
    cell.delayTaskData = self.delayTaskData.userDataArray[_delayTaskData.userDataArray.count - 1 - indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)delayListCellDelegate:(UITableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];

    for (int i = 0; i < _delayTaskData.userDataArray.count; i++) {
        DelayTaskData *delay = _delayTaskData.userDataArray[i];
        if (i == _delayTaskData.userDataArray.count - 1 - indexPath.row) {
            delay.isOpen = @"1";
        }else{
            delay.isOpen = @"0";
        }
    }
    
    [self.tableView reloadData];
    
    DelayTaskData *delay = _delayTaskData.userDataArray[_delayTaskData.userDataArray.count - 1 - indexPath.row];
    [self.delegate delayListVCDelegate:delay type:_type];//回调操作界面  进行命令执行
    
    [CWLAlert alertTitle:[NSString stringWithFormat:@"%@  %@",delay.beforeAndAfter,@"命令开启"] message:[NSString stringWithFormat:@"时间为%@\n(如有其他操作,则此命令失效)",delay.delayDeteShow] titleBtn:nil otherBtn:@"好的" VC:self];return;
    
    
}

- (void)navBtn:(UIButton *)sender{
    if(sender.tag == 0){
        [_delayTaskData saveUserDataPathStr:[NSString stringWithFormat:@"%@_%ld",_dataStorage.peripheralName,_type]];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        TimerAddVC *timerAddVC = [TimerAddVC alloc];
        timerAddVC.type = self.type;
        timerAddVC.delegate = self;
        timerAddVC.dataStorage = self.dataStorage;
        timerAddVC.delayTaskData = self.delayTaskData;
        [self.navigationController pushViewController:timerAddVC animated:YES];
    }
}

@end
