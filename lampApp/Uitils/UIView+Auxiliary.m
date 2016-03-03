//
//  UIView+Auxiliary.m
//  GWOrder
//
//  Created by 陈万里 on 15/6/2.
//  Copyright (c) 2015年 chenwanli. All rights reserved.
//

#import "UIView+Auxiliary.h"

@implementation UIView (Auxiliary)

- (void)setHeight:(float)height{
    ;
}

- (float)height{
   return self.frame.size.height;
}

- (float)width{
    return self.frame.size.width;
}

- (float)x{
    return self.frame.origin.x;
}

- (float)y{
    return self.frame.origin.y;
}

- (float)totalHeigth{
    return self.frame.origin.y + self.frame.size.height;
}

- (float)totalwidth{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCwlRounded:(float)cwlRounded{
    if (cwlRounded == 0) {
        self.layer.cornerRadius = self.width / 2;
    }else{
        self.layer.cornerRadius = cwlRounded;
    }
    self.layer.masksToBounds = YES;
}

- (void)setCwlBorder:(float)cwlBorder{
    self.layer.borderWidth = cwlBorder;
    self.layer.borderColor = [UIColor cwlColorWithHexCode:@"#c6c6c7"].CGColor;
}
@end
