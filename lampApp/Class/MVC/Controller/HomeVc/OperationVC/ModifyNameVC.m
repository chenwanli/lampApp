//
//  ModifyNameVC.m
//  lampApp
//
//  Created by CaiKetao on 15/11/28.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "ModifyNameVC.h"

@interface ModifyNameVC ()

@end

@implementation ModifyNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_A(91, 91, 91, 1);
    
    [self setNavigationBarOrSo:@"名称修改" leftImg:@"barbuttonicon_back" rightImg:@""];

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64)];
    bgView.backgroundColor = RGB_A(91, 91, 91, 1);
    [self.view addSubview:bgView];
    
    _nameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 90, kDeviceWidth - 40, 40)];
    _nameField.borderStyle = UITextBorderStyleRoundedRect;
    _nameField.placeholder = @"请输入名称";
    _nameField.text = _dataStorage.nickname;
    [self.view addSubview:_nameField];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.cwlRounded = 5;
    confirmBtn.frame = CGRectMake(20, _nameField.totalHeigth + 40, _nameField.width, 40);
    confirmBtn.backgroundColor = RGB_A(9, 112, 168, 1);
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
}

- (void)confirmBtn{
    for (DataStorage *data in [DataStorage sharedManager].userDataArray) {
        if ([data.nickname isEqualToString:_dataStorage.nickname]) {
            data.peripheralName = _dataStorage.peripheralName;
            data.nickname = _nameField.text;
            break ;
        }
    }
    
    CWLAlert *alert = [[CWLAlert alloc]initAlertTitle:nil message:@"修改成功" titleBtn:nil otherBtn:@"确定" VC:self];
    alert.delegate = self;
}

- (void)alertView:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
