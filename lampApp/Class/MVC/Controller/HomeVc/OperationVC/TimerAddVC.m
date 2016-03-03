//
//  TimerAddVC.m
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "TimerAddVC.h"

@interface TimerAddVC ()

@end

@implementation TimerAddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarOrSo:@[@"定时任务添加",@"延时任务添加"][_type] leftImg:@"barbuttonicon_back" rightImg:@""];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = NO;
    [self.view addSubview:bgView];
    
    [self uiCreate];
    
}

- (void)uiCreate{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, 200) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kDeviceWidth - 290) / 2, self.tableView.totalHeigth + 20, 50, 30)];
    titleLabel.text = @"时间";
    [self.view addSubview:titleLabel];
    
    for (int i = 0; i < 3; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(titleLabel.totalwidth + i * 90, titleLabel.y, 60, 30)];
        textField.tag = 100 + i;
        textField.placeholder = @[@"时",@"分",@"秒"][i];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(textField:) forControlEvents:UIControlEventEditingChanged];
        [self.view addSubview:textField];
        
        if (i < 2) {
            UILabel *symbolLabel = [[UILabel alloc]initWithFrame:CGRectMake(textField.totalwidth, titleLabel.y, 30, 30)];
            symbolLabel.textAlignment = 1;
            symbolLabel.text = @":";
            [self.view addSubview:symbolLabel];
        }
    }
    
    
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.cwlRounded = 5;
    confirmBtn.frame = CGRectMake((kDeviceWidth - 290) / 2, self.tableView.totalHeigth + 80, 290, 40);
    confirmBtn.backgroundColor = RGB_A(9, 112, 168, 1);
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
}

#pragma mark - 保存
- (void)confirmBtn{
    //    _openRow 模式
    //    _isOpenRow 开关
    UITextField *whenField = (UITextField *)[self.view viewWithTag:100];
    UITextField *pointsField = (UITextField *)[self.view viewWithTag:101];
    UITextField *secondsField = (UITextField *)[self.view viewWithTag:102];
    
    if (whenField.text.length == 0) {
        [CWLAlert alertTitle:nil message:@"请填写时" titleBtn:nil otherBtn:@"好的" VC:self];return;
    }else if (pointsField.text.length == 0){
        [CWLAlert alertTitle:nil message:@"请填写分" titleBtn:nil otherBtn:@"好的" VC:self];return;
    }else if (secondsField.text.length == 0){
        [CWLAlert alertTitle:nil message:@"请填写秒" titleBtn:nil otherBtn:@"好的" VC:self];return;
    }
    
    //    将其他时间失效
    for (DelayTaskData *delay in _delayTaskData.userDataArray) {
        delay.isOpen = @"0";
    }
    
    NSString *delayDeteShowStr = [NSString stringWithFormat:@"%d分%d秒",[whenField.text intValue] * 60 + [pointsField.text intValue],[secondsField.text intValue]];
    NSString *delayDeteStr = [NSString stringWithFormat:@"%d",[whenField.text intValue] * 60 + [pointsField.text intValue] + [secondsField.text intValue]];
    
    NSString *beforeAndAfterStr = @"";
    if (_openRow == 0) {
        if (_isOpenRow == 0) {
            beforeAndAfterStr = @"渐变后关闭";
        }else{
            beforeAndAfterStr = @"渐变后开启";
        }
    }else{
        if (_isOpenRow == 0) {
            beforeAndAfterStr = @"后关闭";
        }else{
            beforeAndAfterStr = @"后开启";
        }
    }
    
    
    DelayTaskData *userData = [[DelayTaskData alloc]init];
    userData.date = [self getDateStringWithDate];
    userData.delayDete = delayDeteStr;
    userData.delayDeteShow = delayDeteShowStr;
    userData.beforeAndAfter = beforeAndAfterStr;
    userData.isOpen = @"1";
    userData.timeDelay = [NSString stringWithFormat:@"%ld",_type];
    
    [_delayTaskData.userDataArray addObject:userData];
    
    [_delayTaskData saveUserDataPathStr:[NSString stringWithFormat:@"%@_%ld",_dataStorage.peripheralName,_type]];
    
    CWLAlert *alert = [[CWLAlert alloc]initAlertTitle:nil message:@[@"添加延时成功",@"添加延时成功"][_type] titleBtn:nil otherBtn:@"确定" VC:self];
    alert.delegate = self;
}

- (void)alertView:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.delegate timerAddVCDelegateReturn];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 表的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_openRow == section) {
        return 2;
    }else{
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *fenge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 59.5, kDeviceWidth, 0.5)];
        fenge.backgroundColor = [UIColor cwlColorWithHexCode:@"adadad"];
        [cell addSubview:fenge];
    }
    cell.textLabel.text = @[@[@"渐变定时关",@"渐变定时开"],@[@"定时关",@"定时开"]][indexPath.section][indexPath.row];
    cell.detailTextLabel.text = @[@[@"设备将在设定时间后关闭,关闭前颜色模式为\"渐变\"",@"设定后将立即关闭设备,设备将在指定时间内开启并进入\"渐变模式\""],@[@"设备将在设定时间后关闭",@"设备将在设定时间后开启,设定后进入关闭状态"]][indexPath.section][indexPath.row];
    cell.detailTextLabel.font = FONT(12);
    cell.detailTextLabel.numberOfLines = 2;
    
    if (_isOpenRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    _isOpenRow = indexPath.row;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
    headerView.tag = section;
    
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectMake(23, 14, 14, 12);
    [headBtn setImage:[UIImage imageNamed:@"GameLibrary_arrUp"] forState:UIControlStateNormal];
    [headBtn setImage:[UIImage imageNamed:@"GameLibrary_arrDown"] forState:UIControlStateSelected];
    [headerView addSubview:headBtn];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 100, 40)];
    titleLabel.text = @[@"模式任务",@"无模式任务"][section];
    [headerView addSubview:titleLabel];
    
    if (_openRow == section) {
        headBtn.selected = YES;
    }else{
        headBtn.selected = NO;
    }
    
    UITapGestureRecognizer *headerTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerTap:)];
    [headerView addGestureRecognizer:headerTap];
    
    UIImageView *fenge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 39.5, kDeviceWidth, 0.5)];
    fenge.backgroundColor = [UIColor cwlColorWithHexCode:@"adadad"];
    [headerView addSubview:fenge];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (void)headerTap:(UITapGestureRecognizer *)sender{
    UIButton *headBtn = (UIButton *)sender.view.subviews[0];
    headBtn.selected = !headBtn.selected;
    
    _openRow = sender.view.tag;
    
    [self.tableView reloadData];
}








- (void)textField:(UITextField *)sender{
    if (sender.tag == 100) {
        if ([sender.text intValue] > 24) {
            sender.text = [sender.text substringWithRange:NSMakeRange(0,sender.text.length - 1)];
        }
    }else{
        if ([sender.text intValue] > 60) {
            sender.text = [sender.text substringWithRange:NSMakeRange(0,sender.text.length - 1)];
        }
    }
}

- (NSString *)getDateStringWithDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateStr;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
