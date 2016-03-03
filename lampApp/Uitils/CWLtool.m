//
//  CWLtool.m
//  GWg-mall
//
//  Created by 陈万里 on 15/6/30.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import "CWLtool.h"

@implementation CWLtool
+ (CGSize)setLableHighly:(NSString *)str lableSize:(float)size width:(float)width{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    
    //    return ceilf(rect.size.height);
    return rect.size;
}

+ (NSMutableAttributedString *)setLabelTextColor:(NSString *)name content:(NSString *)content additional:(NSString *)additional{
    
    NSString *togetherStr = [NSString stringWithFormat:@"%@ %@ %@",name,content,additional];
    NSArray *arrar = [togetherStr componentsSeparatedByString:@" "];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:togetherStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange([arrar[0] length],[arrar[1] length])];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Heiti SC" size:17] range:NSMakeRange([arrar[0] length], [arrar[1] length])];
    return str;
}

+(void)setRightBarButtonWith:(UIViewController*)controller andSEL:(SEL)seletor andImgeName:(NSString*)imageName highlightedImg:(NSString*)highlightedImg andTitle:(NSString*)title{
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 60, 45);
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 5, -10)];
    [back setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [back setImage:[UIImage imageNamed:highlightedImg] forState:UIControlStateSelected];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [back.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [back setTitle:title forState:UIControlStateNormal];
    [back addTarget:controller action:seletor forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBar=[[UIBarButtonItem alloc]initWithCustomView:back];
    [controller.navigationItem setRightBarButtonItem:backBar];
}

+(void)setLeftBarButtonWith:(UIViewController*)controller withSEL:(SEL)seletor andImgeName:(NSString*)imageName andTitle:(NSString*)title{
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(5, 20, 50, 45);
    [back setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [back setTitle:title forState:UIControlStateNormal];
    [back setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 30)];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:controller action:seletor forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBar=[[UIBarButtonItem alloc]initWithCustomView:back];
    [controller.navigationItem setLeftBarButtonItem:backBar];
    
}

+ (NSString *)getUser:(NSString *)keyName{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:keyName];
}

//+ (NSAttributedString *)setTotaLabelTxextCololr:(NSString *)text{
//    NSArray *arrar = [text componentsSeparatedByString:@":"];
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,[arrar[0] length])];
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexCodeCWL:@"#AD0707"] range:NSMakeRange([arrar[0] length] + 2,[arrar[1] length] - 1)];
//    return str;
//}



#pragma mark - 只允许输入数字
+ (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

#pragma mark - 只允许输入手机
/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}


//#pragma mark - 图片加载
//+(void)getBtnImage:(UIButton*)button andUrl:(NSString*)url andPlaceName:(NSString*)placeName loadImgName:(NSString *)loadImgName{
//    
//    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:url] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:loadImgName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        if(image == nil){
//            [button setBackgroundImage:image forState:UIControlStateNormal];
//        }
//    }];
//}

//+(void)getImageView:(UIImageView*)imageView andUrl:(NSString*)url andPlaceName:(NSString*)placeName loadImgName:(NSString *)loadImgName{
//    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:loadImgName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        if(image == nil){
//            imageView.image = [UIImage imageNamed:placeName];
//        }
//    }];
//}

+(UIColor *)colorWithHexCodeCWL:(NSString *)hexCode
{
    NSString *cleanString = [hexCode stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


#pragma marl - mode创建
+(void)createJsonModelWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName
{
    printf("\n@interface %s :NSObject\n",modelName.UTF8String);
    for (NSString *key in dict) {
        NSString *type = ([dict[key] isKindOfClass:[NSNumber class]])?@"NSNumber":@"NSString";
        printf("@property (nonatomic,copy) %s *%s;\n",type.UTF8String,key.UTF8String);
    }
    printf("@end\n");
    
}

//+ (UInt8 *)bdAddrLow:(int)date{
//    UInt8 brakdata[4];
//    UInt8 jlkj[1];
//    bdAddrLow2Str(5000, brakdata, jlkj);
    
//    return brakdata;
//}

//void bdAddrLow2Str(int data,UInt8 *brakdata, UInt8 *datalong)
//{
//    int i,j,l;
//    i = data / 16;
//    if( i ){
//        brakdata[0] = data % 16;
//        j = i / 16;
//        if( j ){
//            brakdata[1] = i % 16;
//            l = j / 16;
//            if( l ){
//                brakdata[2] = j % 16;
//                datalong[0] = 4;
//                brakdata[3] = l % 16;
//            }
//            else{
//                datalong[0] = 3;
//                brakdata[2] = j % 16;
//            }
//        }
//        else{
//            datalong[0] = 2;
//            brakdata[1] = i % 16;
//        }
//    }
//    else{
//        datalong[0] = 1;
//        brakdata[0] = data % 16;
//    }
//}
@end
