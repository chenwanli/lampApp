//
//  HomeTabBarVC.m
//  eTong
//
//  Created by 陈万里 on 15/10/22.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import "HomeTabBarVC.h"
#import "HomeVc.h"
#import "FoundVC.h"
#import "PersonalVC.h"

@interface HomeTabBarVC ()

@end

@implementation HomeTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
    HomeVc *homeVc = [[HomeVc alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:homeVc];
    nav1.navigationBar.hidden = YES;

    FoundVC *foundVC = [[FoundVC alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:foundVC];
    nav2.navigationBar.hidden = YES;
    
    PersonalVC *personalVC = [[PersonalVC alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:personalVC];
    nav3.navigationBar.hidden = YES;
    
    self.viewControllers = @[nav1,nav2,nav3];
    
    UIImageView *barImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, kDeviceHeight - 44, kDeviceWidth, 44)];
    barImg.image = IMG(@"底部2");
    [self.view addSubview:barImg];
    
    float widtht = kDeviceWidth / 4;
    for (int i = 0; i < 3; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * widtht, kDeviceHeight - 44, widtht, 44);
        [self.view addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake((button.width - 25) / 2, 5, 25, 34)];
        img.image = [UIImage imageNamed:[NSString stringWithFormat:@"D%d",i + 1]];
        [button addSubview:img];
    }
//    self.selectedIndex = 2;
}

- (void)buttonClick:(UIButton *)sender{
    self.selectedIndex = sender.tag;
}


@end
