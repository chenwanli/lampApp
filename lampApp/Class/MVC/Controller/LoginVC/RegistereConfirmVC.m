//
//  RegistereConfirmVC.m
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "RegistereConfirmVC.h"

@interface RegistereConfirmVC ()

@end

@implementation RegistereConfirmVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationBarTiti:@"设置密码" leftImg:@""];
    
    UITextField *textField = nil;
    for (int i = 0; i < 3; i ++) {
        textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 70 + 40 * i, kDeviceWidth - 40, 35)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @[@"呢称",@"请输入密码",@"请再次输入密码"][i];
        [self.view addSubview:textField];
    }
    
    UIButton *confirmBtn = [UIButton cwlBtnType:UIButtonTypeCustom rect:CGRectMake(20, textField.totalHeigth + 10, kDeviceWidth - 40, 40) radius:5 title:@"完成注册" titleColor:[UIColor whiteColor] view:self.view];
    confirmBtn.titleLabel.font = FONT(15);
    confirmBtn.backgroundColor = [UIColor blueColor];
    [confirmBtn addTarget:self action:@selector(confirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
}

- (void)confirmBtn{
    
}



@end
