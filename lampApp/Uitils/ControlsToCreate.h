//
//  UIButton+CWLBtn.h
//  GWhome
//
//  Created by 陈万里 on 15/9/29.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CWLBtn)
+ (UIButton *)cwlBtnType:(UIButtonType)type rect:(CGRect)rect radius:(CGFloat)radius title:(NSString *)title titleColor:(UIColor *)titleColor view:(UIView *)view;
@end


@interface UILabel (CWLLabel)

@end


@interface NSString (CWLStr)
- (NSString *) macaddress;

@end

/*颜色*/
@interface UIColor (CWLColor)
+(UIColor *)cwlColorWithHexCode:(NSString *)hexCode;
@end