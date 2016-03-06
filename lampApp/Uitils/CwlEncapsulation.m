//
//  CwlEncapsulation.m
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "CwlEncapsulation.h"

@implementation CwlEncapsulation

@end

@implementation CWLSlider

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.minimumValue = 0;
        if ([title isEqualToString:@"BRIGHTNE"]) {
            self.maximumValue = 255;
        }else{
            self.maximumValue = 255;
        }
        self.maximumTrackTintColor = color;
        
        self.layer.anchorPoint=CGPointMake(0, 0.5);
        
        self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.block) {
        if ([UIColor blueColor] == self.maximumTrackTintColor) {
            NSLog(@"频率值  %d",255 - (int)self.value);
            if ((int)self.value == 0) {
                self.block([DataObject cwlByte:0]);
            }else if ((int)self.value == 255){
                self.block([DataObject cwlByte:1]);
            }else{
                self.block([DataObject cwlByte:255 - (int)self.value]);
            }
            
            NSLog(@"1--------%f",255 - self.value);
        }else{
            self.block([DataObject cwlByte:(int)self.value]);
            
            NSLog(@"2--------%f",255 - self.value);
        }
    }
}

@end

//调色扳
@implementation SwatchesImg
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _image = IMG(@"色饼");
        self.cwlRounded = 0;
        self.image = _image;
        self.userInteractionEnabled = YES;
        
        _columnWidth = _image.size.width / frame.size.width;
        _columnhigher = _image.size.height / frame.size.height;
    }
    return self;
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
//    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
//
//    Byte *colorByte = [self getHexStringByColor:[self getPixelColorAtLocation:point]];
//    [self.delegate swatchesDelegateByte:colorByte];
//    
//    self.backgroundColor = [self getPixelColorAtLocation:point];
//}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    
    NSData *colorData = [self getHexStringByColor:[self getPixelColorAtLocation:point]];
    
    [self.delegate swatchesDelegateData:colorData];
    
//    [self.delegate bgColor:[self getPixelColorAtLocation:point]];
}

- (UIColor*) getPixelColorAtLocation:(CGPoint)point {
    UIColor* color = nil;
    UIImage *watchesImg = _image;
    CGImageRef inImage = watchesImg.CGImage;
    
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil;  }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    CGContextDrawImage(cgctx, rect, inImage);
    
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        @try {
            int offset = 4*((w*round(point.y * _columnhigher))+round(point.x * _columnWidth));
            NSLog(@"offset: %d", offset);
            int alpha =  data[offset];
            int red = data[offset+1];
            int green = data[offset+2];
            int blue = data[offset+3];
            NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
            color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
        }
        @catch (NSException * e) {
            NSLog(@"%@",[e reason]);
        }
        @finally {
        }
        
    }
    // When finished, release the context
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) { free(data); }
    
    return color;
}

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color spacen");
        return NULL;
    }
    
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    CGColorSpaceRelease( colorSpace );
    
    return context;
}


- (NSData *)getHexStringByColor:(UIColor *)originColor{
    NSDictionary *colorDic = [self getRGBDictionaryByColor:originColor];
    int r = [colorDic[@"R"] floatValue] * 255;
    int g = [colorDic[@"G"] floatValue] * 255;
    int b = [colorDic[@"B"] floatValue] * 255;
    
    Byte colorByte[3];
    colorByte[0] = [DataObject cwlByte:r];
    colorByte[1] = [DataObject cwlByte:g];
    colorByte[2] = [DataObject cwlByte:b];
    
    NSData *data =[[NSData alloc] initWithBytes:colorByte length:3];
    
    return data;
}


- (NSDictionary *)getRGBDictionaryByColor:(UIColor *)originColor{
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    }
    else{
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return @{@"R":@(r),
             @"G":@(g),
             @"B":@(b),
             @"A":@(a)};
}
@end