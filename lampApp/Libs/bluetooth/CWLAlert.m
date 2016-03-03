//
//  CWLAlert.m
//  提示框
//
//  Created by 陈万里 on 15/10/16.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import "CWLAlert.h"
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES:NO)

@implementation CWLAlert

- (id)initAlertTitle:(NSString *)Title message:(NSString *)message titleBtn:(NSString *)titleBtn otherBtn:(NSString *)otherBtn VC:(UIViewController *)vc {
    self = [super init];
    if (self) {
        if (IOS8) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:message preferredStyle:UIAlertControllerStyleAlert];
            
            if (titleBtn != nil) {
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:titleBtn style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [self.delegate alertView:alert clickedButtonAtIndex:0];
                }];
                [alert addAction:cancelAction];
            }
            
            if (otherBtn != nil) {
                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:otherBtn style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"点击确认");
                    [self.delegate alertView:alert clickedButtonAtIndex:1];
                }];
                [alert addAction:defaultAction];
            }
            
            [vc presentViewController:alert animated:YES completion:nil];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:Title message:message delegate:self cancelButtonTitle:titleBtn otherButtonTitles:otherBtn, nil];
            [alert show];
        }
    }
    return self;
}

+(void)alertTitle:(NSString *)Title message:(NSString *)message titleBtn:(NSString *)titleBtn otherBtn:(NSString *)otherBtn VC:(UIViewController *)vc {
    
    if (IOS8) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (titleBtn != nil) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:titleBtn style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:cancelAction];
        }
        
        if (otherBtn != nil) {
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:otherBtn style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击确认");
            }];
            [alert addAction:defaultAction];
        }
        
        [vc presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:Title message:message delegate:self cancelButtonTitle:titleBtn otherButtonTitles:otherBtn, nil];
        [alert show];
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        NSLog(@"取消");
        [self.delegate alertView:alertView clickedButtonAtIndex:0];
    }else{
        NSLog(@"确认");
        [self.delegate alertView:alertView clickedButtonAtIndex:1];
    }
}


@end
