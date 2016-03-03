//  注册&密码找回
//  RegisteredVC.m
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "RegisteredVC.h"
#import "RegistereConfirmVC.h"
@interface RegisteredVC ()

@end

@implementation RegisteredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationBarTiti:@[@"忘记密码",@"注册"][_type] leftImg:@""];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 70, kDeviceWidth - 40, 35)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"手机号码/邮箱";
    [self.view addSubview:textField];

    UIButton *nextBtn = [UIButton cwlBtnType:UIButtonTypeCustom rect:CGRectMake(20, textField.totalHeigth + 10, kDeviceWidth - 40, 40) radius:5 title:@[@"获取验证码",@"下一步"][_type] titleColor:[UIColor whiteColor] view:self.view];
    nextBtn.titleLabel.font = FONT(15);
    nextBtn.backgroundColor = [UIColor blueColor];
    [nextBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];

    
    if(_type == 1){
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth - 215, nextBtn.totalHeigth + 10, 105, 30)];
        lable.font = FONT(15);
        lable.text = @"我已阅读并同意";
        [self.view addSubview:lable];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(lable.totalwidth, lable.y, 90, 30);
        [button setTitle:@"注册服务协议" forState:UIControlStateNormal];
        button.titleLabel.font = FONT(15);
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
    }
}

- (void)buttonClick:(UIButton *)sender{
    if (sender.tag == 0) {
        if ([sender.titleLabel.text isEqualToString:@"获取验证码"]) {
            
        }else{
            RegistereConfirmVC *registereConfirmVC = [[RegistereConfirmVC alloc]init];
            [self.navigationController pushViewController:registereConfirmVC animated:YES];
        }
    }else{
        
    }
}

@end
