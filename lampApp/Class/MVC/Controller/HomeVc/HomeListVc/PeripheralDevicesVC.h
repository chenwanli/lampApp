//
//  PeripheralDevicesVC.h
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol peripheralDevicesVCDelegate <NSObject>

- (void)peripheralDevicesVCDelegate;

@end

@interface PeripheralDevicesVC : UIViewController<UITableViewDataSource,UITableViewDelegate,CBCentralManagerDelegate>{
    UILabel *_equipmentListLabel;
}
@property(nonatomic,assign)id <peripheralDevicesVCDelegate> dategate;
@property(nonatomic,strong)UITableView *tableView;
@property CBCentralManager *cm;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
