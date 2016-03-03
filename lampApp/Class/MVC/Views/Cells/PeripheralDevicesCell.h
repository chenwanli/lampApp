//
//  PeripheralDevicesCell.h
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#include <sys/types.h>

#include <sys/socket.h>

#include <ifaddrs.h>

#include <netdb.h>

#include <net/if_dl.h>

#include <string.h>



#if ! defined(IFT_ETHER)

#define IFT_ETHER 0x6/* Ethernet CSMACD */

#endif
@protocol peripheralDevicesCellDelegate <NSObject>

- (void)PeripheralDevicesCellDelegateCell:(UITableViewCell *)cell;

@end

@interface PeripheralDevicesCell : UITableViewCell{
    UIImageView *_typeImg;
    UILabel     *_typeLael;
    UILabel     *_macNameLabel;
    UILabel     *_addressLabel;
    UIButton    *_addBtn;
}
@property(nonatomic,assign)id <peripheralDevicesCellDelegate> delegate;
@property(nonatomic,strong)CBPeripheral *peripheral;
@property (strong,nonatomic) CBCharacteristic *cbCharacteristcs;
@end
