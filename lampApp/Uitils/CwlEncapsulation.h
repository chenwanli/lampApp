//
//  CwlEncapsulation.h
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CwlEncapsulation : NSObject

@end


//滑动杆
@interface CWLSlider : UISlider
- (id)initWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title;
@property(nonatomic,copy)void(^block)(Byte sliderByte);
@end


@protocol swatchesDelegate <NSObject>

- (void)swatchesDelegateByte:(Byte *)byte;
@end
@interface SwatchesImg : UIImageView{
    float _columnWidth;
    float _columnhigher;
    UIImage *_image;
}
@property(nonatomic,assign)id <swatchesDelegate> delegate;
@end


