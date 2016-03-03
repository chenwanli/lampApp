//
//  UIViewController+Transit.m
//  GWhome
//
//  Created by 陈万里 on 15/9/24.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import "UIViewController+Transit.h"
#import "AppDelegate.h"

#import "HomeTabBarVC.h"
#import "LoginVC.h"
#import <objc/runtime.h>
@implementation UIViewController (Transit)

- (void)homeVC{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    HomeTabBarVC *homeVC = [[HomeTabBarVC alloc]init];
    app.window.rootViewController = homeVC;
}

- (void)loginVC{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    LoginVC *loginVc = [[LoginVC alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVc];
    nav.navigationBar.hidden = YES;
    app.window.rootViewController = nav;
}

- (UIView *)setNavigationBarTiti:(NSString *)titi leftImg:(NSString *)imgStr{
    UIView *navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 64)];
    navBarView.backgroundColor = RGB_A(34, 146, 219, 1);
    
//    标题
    UILabel *titiLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, kDeviceWidth, 20)];
    titiLable.text = titi;
    titiLable.textColor = [UIColor whiteColor];
    titiLable.textAlignment = 1;
    [navBarView addSubview:titiLable];
    
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame = CGRectMake(0, 0, 64, 64);
    [navBarView addSubview:returnBtn];
    
    if (imgStr != nil) {
        [returnBtn setImage:[UIImage imageNamed:@"btn_back_white_normal"] forState:UIControlStateNormal];
        returnBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
        [returnBtn addTarget:self action:@selector(returnBtn) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [returnBtn setTitle:@"" forState:UIControlStateNormal];
    }
    
    [self.view addSubview:navBarView];
    
    return navBarView;
}

- (void)returnBtn{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UIView *)setNavigationBarOrSo:(NSString *)titi leftImg:(NSString *)imgStr rightImg:(NSString *)rightImgStr{
    
    UIView *navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 64)];
    navBarView.clipsToBounds = NO;
    navBarView.backgroundColor = RGB_A(26, 26, 29, 1);
    
    //    标题
    UILabel *titiLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, kDeviceWidth, 20)];
    titiLable.text = titi;
    titiLable.font = FONT(20);
    titiLable.textColor = [UIColor whiteColor];
    titiLable.textAlignment = 1;
    [navBarView addSubview:titiLable];
    
    for (int i = 0; i < 2; i ++) {
        UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        returnBtn.tag = i;
        [navBarView addSubview:returnBtn];
        if (imgStr != nil) {
            
            returnBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
            [returnBtn addTarget:self action:@selector(navBtn:) forControlEvents:UIControlEventTouchUpInside];
            [returnBtn setTitle:@"" forState:UIControlStateNormal];
        }
        [self.view addSubview:navBarView];
        
        if (i == 0) {
            returnBtn.frame = CGRectMake(0, 0, 64, 64);
            [returnBtn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
            returnBtn.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 10);
        }else{
            returnBtn.frame = CGRectMake(kDeviceWidth - 64, 0, 64, 64);
            [returnBtn setImage:[UIImage imageNamed:rightImgStr] forState:UIControlStateNormal];
            returnBtn.imageEdgeInsets = UIEdgeInsetsMake(20, 10, 0, 10);
        }   
    }
    return navBarView;
}

- (void)navBtn:(UIButton *)sender{
    if(sender.tag == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        
    }
}

//+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        // When swizzling a class method, use the following:
//        // Class class = object_getClass((id)self);
//        swizzleMethod(class, @selector(viewDidLoad), @selector(aop_viewDidLoad));
//        swizzleMethod(class, @selector(viewDidAppear:), @selector(aop_viewDidAppear:));
//        swizzleMethod(class, @selector(viewWillAppear:), @selector(aop_viewWillAppear:));
//        swizzleMethod(class, @selector(viewWillDisappear:), @selector(aop_viewWillDisappear:));
//        
//    });
//}
//
//- (void)aop_viewDidAppear:(BOOL)animated {
//    [self aop_viewDidAppear:animated];
//    self.view.backgroundColor = [UIColor yellowColor];
//    NSLog(@"--------%@",[self class]);
//}




//-(void)aop_viewWillAppear:(BOOL)animated {
//    [self aop_viewWillAppear:animated];
//#ifndef DEBUG
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
//#endif
//}
//-(void)aop_viewWillDisappear:(BOOL)animated {
//    [self aop_viewWillDisappear:animated];
//#ifndef DEBUG
//    [MobClick endLogPageView:NSStringFromClass([self class])];
//#endif
//}
//- (void)aop_viewDidLoad {
//    [self aop_viewDidLoad];if ([self isKindOfClass:[UINavigationController class]]) {    UINavigationController *nav = (UINavigationController *)self;
//        nav.navigationBar.translucent = NO;
//        nav.navigationBar.tintColor = [UIColor whiteColor];    NSDictionary *titleAtt = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//        [[UINavigationBar appearance] setTitleTextAttributes:titleAtt];
//        [[UIBarButtonItem appearance]
//         setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
//         forBarMetrics:UIBarMetricsDefault];
//    }//    self.view.backgroundColor = [UIColor whiteColor];self.navigationController.interactivePopGestureRecognizer.delegate = (id<uigesturerecognizerdelegate>)self;
//}
//
//void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)   {
//    Method originalMethod = class_getInstanceMethod(class, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);BOOL didAddMethod =
//    class_addMethod(class,
//                    originalSelector,
//                    method_getImplementation(swizzledMethod),
//                    method_getTypeEncoding(swizzledMethod));if (didAddMethod) {
//        class_replaceMethod(class,
//                            swizzledSelector,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//    } else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}



@end
