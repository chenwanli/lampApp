//
//  SlidingView.h
//  滑动杆
//
//  Created by 陈万里 on 16/3/4.
//  Copyright © 2016年 chenwanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SlidingImgViewDelegate <NSObject>

- (void)slidingImgViewDelegateFlot:(float)flot proportion:(int)proportion idEnd:(BOOL)isEnd;

@end
@interface SlidingImgView : UIImageView{
    UILabel *_progressLable;
}
@property(nonatomic,assign)float high;
@property(nonatomic,strong)id <SlidingImgViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame onRect:(CGRect)onRect;
@end


@interface SlidingView : UIView<SlidingImgViewDelegate>{
    UIImageView *_colorImgView;
}
@property(nonatomic,copy)void(^block)(Byte sliderByte);
- (id)initWithFrame:(CGRect)frame title:(NSString *)title;
@end



