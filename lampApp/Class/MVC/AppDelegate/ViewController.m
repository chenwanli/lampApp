//
//  ViewController.m
//  eTong
//
//  Created by 陈万里 on 15/10/22.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import "ViewController.h"
#import "HomeVc.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataStorage sharedManager];
    
    [self homeVC];
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    HomeVc *homeVc = [[HomeVc alloc]init];
    app.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:homeVc];
    homeVc.navigationController.navigationBar.hidden = YES;
    
//    [self loginVC];
}




@end
