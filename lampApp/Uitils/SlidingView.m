//
//  SlidingView.m
//  滑动杆
//
//  Created by 陈万里 on 16/3/4.
//  Copyright © 2016年 chenwanli. All rights reserved.
//

#import "SlidingView.h"

@implementation SlidingView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, -30, 60, 20)];
        lable.text = title;
        lable.textAlignment = 1;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textColor = RGB_A(137, 138, 142, 1);
        [self addSubview:lable];
        
//        背景条
        UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 5) / 2, 0, 5, frame.size.height)];
        bgImgView.image = [UIImage imageNamed:@"设计图_10"];
        [self addSubview:bgImgView];
        
//        颜色条
        _colorImgView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 5) / 2, frame.size.height, 5, 0 )];
        _colorImgView.layer.cornerRadius = 2;
        _colorImgView.layer.masksToBounds = YES;
        _colorImgView.backgroundColor = RGB_A(27, 81, 173, 1);;
        [self addSubview:_colorImgView];
        
        SlidingImgView *slidingImgView = [[SlidingImgView alloc]initWithFrame:CGRectMake((frame.size.width - 60) / 2, frame.size.height - 30, 60, 60) onRect:frame];
        slidingImgView.delegate = self;
        slidingImgView.high = frame.size.height;
        [self addSubview:slidingImgView];
        
        UILabel *bottomLable = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height + 10, 60, 20)];
        bottomLable.text = @"0%";
        bottomLable.textAlignment = 1;
        bottomLable.font = [UIFont systemFontOfSize:12];
        bottomLable.textColor = RGB_A(137, 138, 142, 1);
        [self addSubview:bottomLable];
    }
    return self;
}

- (void)slidingImgViewDelegateFlot:(float)flot proportion:(int)proportion idEnd:(BOOL)isEnd{
    _colorImgView.frame = CGRectMake((self.frame.size.width - 5) / 2, flot, 5, self.frame.size.height - flot);

    NSLog(@"-------%d",proportion);
    if (isEnd) {
        if (self.block) {
            int value = 255 * (proportion / 100.0);
            if (self.superview.frame.origin.x > 150) {
                NSLog(@"频率值  %d",255 - value);
                self.block([DataObject cwlByte:255 - value]);
            }else{
                self.block([DataObject cwlByte:value]);
            }
        }
    }
}

@end


@implementation SlidingImgView
- (id)initWithFrame:(CGRect)frame onRect:(CGRect)onRect{
    self = [super initWithFrame:frame];
    if (self){
        self.userInteractionEnabled = YES;

        UIImageView *pegeImg = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 15) / 2, (frame.size.height - 15) / 2, 15, 15)];
        pegeImg.image = [UIImage imageNamed:@"未标题-1"];
        [self addSubview:pegeImg];
        
        _progressLable = [[UILabel alloc]init];
        _progressLable.text = @"0%";
        _progressLable.font = [UIFont systemFontOfSize:12];
        _progressLable.textColor = RGB_A(137, 138, 142, 1);
        [pegeImg addSubview:_progressLable];
        
        if (onRect.origin.x > 150) {
            _progressLable.frame = CGRectMake(-40,0, 35, 15);
            _progressLable.textAlignment = 2;
        }else{
            _progressLable.frame = CGRectMake(20,0, 35, 15);
            
        }
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:panGesture];
    }
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
//    NSLog(@"---------%@-------%@--------%f",NSStringFromCGPoint(point),NSStringFromCGRect(self.frame),_high);
    
    if(point.y < 0 && self.frame.origin.y + 30 <= 0){
        
    }else if(point.y > 0 && self.frame.origin.y + 30 >= _high){
        
    }else{
        self.center = CGPointMake(self.center.x, self.center.y + point.y);
    }
    [panGestureRecognizer setTranslation:CGPointZero inView:self];

    int proportion = ((_high - (self.frame.origin.y + 30)) / _high) * 100;
    
//    NSLog(@"---------%d",proportion);
    
    if (proportion < 0) {
        proportion = 0;
    }else if (proportion > 100){
        proportion = 100;
    }
    
    _progressLable.text = [NSString stringWithFormat:@"%d%%",proportion];
    
    [self.delegate slidingImgViewDelegateFlot:self.frame.origin.y + 30 proportion:proportion idEnd:NO];
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        [self.delegate slidingImgViewDelegateFlot:self.frame.origin.y + 30 proportion:proportion idEnd:YES];
    }
}
@end
