//
//  EquipmentCell.m
//  lampApp
//
//  Created by 陈万里 on 15/11/3.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "EquipmentCell.h"

@implementation EquipmentCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        float equipmentImgWidth = (kDeviceWidth - 80) / 3 - 10;
        self.equipmentImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, equipmentImgWidth, equipmentImgWidth)];
        [self addSubview:self.equipmentImg];
        
        self.nameLable = [[UILabel alloc]initWithFrame:CGRectMake(5, equipmentImgWidth, equipmentImgWidth, 20)];
        self.nameLable.textAlignment = 1;
        self.nameLable.font = FONT(12);
        [self addSubview:self.nameLable];
        
        _editorImg = [[UIImageView alloc]initWithFrame:CGRectMake(equipmentImgWidth, 0, 20, 20)];
//        _editorImg.backgroundColor = RGB_A(0, 0, 0, 0.5);
        _editorImg.image = IMG(@"EmoticonCloseButton");
        [self addSubview:_editorImg];
    }
    return self;
}

- (void)setEditor:(BOOL)editor{
    _editorImg.hidden = editor;
}
@end
