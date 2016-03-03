//
//  DelayListCell.h
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol delayListCellDelegate <NSObject>
- (void)delayListCellDelegate:(UITableViewCell *)cell;
@end

@interface DelayListCell : UITableViewCell{
    UILabel *_dateLabel;
    UILabel *_lengthLabel;
    
    UILabel *_afterLabel;
    UISwitch *_typeSwitch;
}
@property(nonatomic,assign)id <delayListCellDelegate> delegate;
@property(nonatomic,strong)DelayTaskData *delayTaskData;

@end
