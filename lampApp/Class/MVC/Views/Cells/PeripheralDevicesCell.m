//
//  PeripheralDevicesCell.m
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "PeripheralDevicesCell.h"

@implementation PeripheralDevicesCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _typeImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 15, 30, 30)];
        _typeImg.image = IMG(@"灯小图");
        [self addSubview:_typeImg];
        
        _typeLael = [[UILabel alloc]initWithFrame:CGRectMake(_typeImg.totalwidth + 5, 0, kDeviceWidth - 120, 20)];
        _typeLael.text = @"智能灯";
        [self addSubview:_typeLael];
        
        _macNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_typeLael.x, _typeLael.totalHeigth, kDeviceWidth - 120, 20)];
        _macNameLabel.text = @"Rui_1001a";
        [self addSubview:_macNameLabel];
        
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(_typeLael.x, _macNameLabel.totalHeigth, kDeviceWidth - 120, 20)];
        _addressLabel.font = FONT(10);
        [self addSubview:_addressLabel];
        
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(kDeviceWidth - 70, 15, 60, 30);
        [_addBtn setImage:[UIImage imageNamed:@"添加按键2"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(addBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addBtn];
        
        UIImageView *fenge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 59.5, kDeviceWidth, 0.5)];
        fenge.backgroundColor = [CWLtool colorWithHexCodeCWL:@"adadad"];
        [self addSubview:fenge];
    }
    return self;
}

- (void)setPeripheral:(CBPeripheral *)peripheral{
    _peripheral = peripheral;
    _macNameLabel.text = peripheral.name;

    NSLog(@"地址-----%@",[@"06AF2A1C1F28945DBEBE28BF03C9489A" macaddress]);
//    [self zhuan:peripheral.identifier.UUIDString];
    
    _addressLabel.text = peripheral.identifier.UUIDString;
}



- (void)zhuan:(NSString *)ud{
//    CBUUID *macServiceUUID = [CBUUID UUIDWithString:@"180A"];
//    CBUUID *macCharcteristicUUID = [CBUUID UUIDWithString:@"2A23"];

    
    
//    http://blog.csdn.net/macpu/article/details/49805763

//    NSLog(@"地址-----%@",macString);
}


void doMacTest() {
    
    BOOL                        success;
    
    struct ifaddrs *            addrs;
    
    const struct ifaddrs *      cursor;
    
    const struct sockaddr_dl *  dlAddr;
    
    const uint8_t *             base;
    
    
    
    // We look for interface "en0" on iPhone
    
    
    
    success = getifaddrs(&addrs) == 0;
    
    if (success) {
        
        cursor = addrs;
        
        while (cursor != NULL) {
            
            if ( (cursor->ifa_addr->sa_family == AF_LINK)
                
                && (((const struct sockaddr_dl *) cursor->ifa_addr)->sdl_type == IFT_ETHER)
                
                && (strcmp(cursor->ifa_name, "en0") == 0)) {
                
                dlAddr = (const struct sockaddr_dl *) cursor->ifa_addr;
                
                base = (const uint8_t *) &dlAddr->sdl_data[dlAddr->sdl_nlen];
                
                
                
                if (dlAddr->sdl_alen == 6) {
                    
                    fprintf(stderr, ">>>             WIFI MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]);
                    
                    fprintf(stderr, ">>> IPHONE BLUETOOTH MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]-1);
                    
                    fprintf(stderr, ">>>   IPAD BLUETOOTH MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]+1);
                    
                } else {
                    
                    fprintf(stderr, "ERROR - len is not 6");
                    
                }
                
            }
            
            cursor = cursor->ifa_next;
            
        }
        
        freeifaddrs(addrs);
        
    }
    
    
    
}

- (void)addBtn{
    [self.delegate PeripheralDevicesCellDelegateCell:self];
}

@end
