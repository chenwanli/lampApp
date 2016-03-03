//
//  CWLtool.h
//  GWg-mall
//
//  Created by 陈万里 on 15/6/30.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <ifaddrs.h>
#import <arpa/inet.h>

@interface CWLtool : NSObject
+ (CGSize)setLableHighly:(NSString *)str lableSize:(float)size width:(float)width;
+ (NSMutableAttributedString *)setLabelTextColor:(NSString *)name content:(NSString *)content additional:(NSString *)additional;

//导航栏左按钮
+(void)setLeftBarButtonWith:(UIViewController*)controller withSEL:(SEL)seletor andImgeName:(NSString*)imageName andTitle:(NSString*)title;
//导航栏右按钮
+(void)setRightBarButtonWith:(UIViewController*)controller andSEL:(SEL)seletor andImgeName:(NSString*)imageName highlightedImg:(NSString*)highlightedImg andTitle:(NSString*)title;

+ (NSString *)getUser:(NSString *)keyName;

//+ (NSAttributedString *)setTotaLabelTxextCololr:(NSString *)text;

#pragma mark - 只允许输入数字
+ (BOOL)validateNumber:(NSString*)number;
/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL)isValidateMobile:(NSString *)mobile;

+(UIColor *)colorWithHexCodeCWL:(NSString *)hexCode;

//#pragma mark - 图片加载
//+(void)getBtnImage:(UIButton*)button andUrl:(NSString*)url andPlaceName:(NSString*)placeName loadImgName:(NSString *)loadImgName;
//
//+(void)getImageView:(UIImageView*)imageView andUrl:(NSString*)url andPlaceName:(NSString*)placeName loadImgName:(NSString *)loadImgName;

#pragma marl - mode创建
+(void)createJsonModelWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName;

//+ (UInt8 *)bdAddrLow:(int)date;
@end
