//  登录
//  LoginVC.m
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "LoginVC.h"
#import "RegisteredVC.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationBarTiti:@"登录" leftImg:nil];
    
    for (int i = 0; i < 2; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 70 + i * 40, kDeviceWidth - 40, 35)];
        textField.placeholder = @[@"  用户ID/手机号/邮箱",@"  密码"][i];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textField];
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@[@"忘记密码",@"注册新用户"][i] forState:UIControlStateNormal];
        if (i == 0) {
            button.frame = CGRectMake(20, 220, 100, 30);
        }else{
            button.frame = CGRectMake(kDeviceWidth - 120, 220, 100, 30);
            button.titleLabel.textAlignment = 2;
        }
        button.tag = i + 1;
        button.titleLabel.font = FONT(15);
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    UIButton *loginBtn = [UIButton cwlBtnType:UIButtonTypeCustom rect:CGRectMake(20, 160, kDeviceWidth - 40, 40) radius:5 title:@"登 录" titleColor:[UIColor whiteColor] view:self.view];
    loginBtn.titleLabel.font = FONT(15);
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
}
/*
 0.登录
 1.忘记密码
 2.注册新用户
 */

- (void)buttonClick:(UIButton *)sender{
    if (sender.tag == 0) {
        [self homeVC];
    }else if (sender.tag == 1){
        RegisteredVC *registeredVC = [[RegisteredVC alloc]init];
        registeredVC.type = 0;
        [self.navigationController pushViewController:registeredVC animated:YES];
    }else{
        RegisteredVC *registeredVC = [[RegisteredVC alloc]init];
        registeredVC.type = 1;
        [self.navigationController pushViewController:registeredVC animated:YES];
    }
}


@end
