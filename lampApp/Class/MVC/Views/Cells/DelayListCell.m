//
//  DelayListCell.m
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "DelayListCell.h"

@implementation DelayListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, kDeviceWidth - 20, 90)];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.cwlRounded = 5;
        bgView.cwlBorder = 1;
        [self addSubview:bgView];
        
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 30)];
        _dateLabel.font = FONT(15);
        [bgView addSubview:_dateLabel];
        
        UIImageView *dateFenge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 29.5, kDeviceWidth, 0.5)];
        dateFenge.backgroundColor = [UIColor cwlColorWithHexCode:@"adadad"];
        [bgView addSubview:dateFenge];
        
        _lengthLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 150, 60)];
        _lengthLabel.font = FONT(15);
        [bgView addSubview:_lengthLabel];
        
        _afterLabel = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth - 240, 30, 150, 60)];
        _afterLabel.textAlignment = 2;
        _afterLabel.font = FONT(15);
        [bgView addSubview:_afterLabel];
        
        _typeSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(kDeviceWidth - 80, 44.5, 50, 31)];
        [_typeSwitch addTarget:self action:@selector(typeSwitch:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:_typeSwitch];
    }
    return self;
}
//date;//操作时间
//delayDete;//延时时间
//beforeAndAfter;//后开启  后关闭
//isOpen;//是否开启
- (void)setDelayTaskData:(DelayTaskData *)delayTaskData{
    _delayTaskData = delayTaskData;
    _dateLabel.text = delayTaskData.date;
    _lengthLabel.text = delayTaskData.delayDeteShow;
    _afterLabel.text = delayTaskData.beforeAndAfter;
    _typeSwitch.on = [delayTaskData.isOpen boolValue];
    NSLog(@"是否开启 cell ----%@",delayTaskData.isOpen);
}

- (void)typeSwitch:(UISwitch *)switchC{
    NSLog(@"开启关闭");
    [self.delegate delayListCellDelegate:self];
}
@end
