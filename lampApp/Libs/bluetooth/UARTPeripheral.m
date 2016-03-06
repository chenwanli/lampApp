//
//  UARTPeripheral.m
//  nRF UART
//
//  Created by Ole Morten on 1/12/13.
//  Copyright (c) 2013 Nordic Semiconductor. All rights reserved.
//

#import "UARTPeripheral.h"

@interface UARTPeripheral ()
@property CBService *uartService;
@property CBCharacteristic *rxCharacteristic;
@property CBCharacteristic *txCharacteristic;

@end

@implementation UARTPeripheral
@synthesize peripheral = _peripheral;
@synthesize delegate = _delegate;

@synthesize uartService = _uartService;
@synthesize rxCharacteristic = _rxCharacteristic;
@synthesize txCharacteristic = _txCharacteristic;

+ (CBUUID *) uartServiceUUID
{
    return [CBUUID UUIDWithString:@"FFF0"];
}

+ (CBUUID *) txCharacteristicUUID
{
    return [CBUUID UUIDWithString:@"FFF1"];
}

+ (CBUUID *) rxCharacteristicUUID
{
    return [CBUUID UUIDWithString:@"FFF4"];
}

+ (CBUUID *) deviceInformationServiceUUID
{
    return [CBUUID UUIDWithString:@"180A"];
}

+ (CBUUID *) hardwareRevisionStringUUID
{
    return [CBUUID UUIDWithString:@"2A27"];
}


+ (CBUUID *) getMa1RevisionStringUUID
{
    return [CBUUID UUIDWithString:@"180A"];
}

+ (CBUUID *) getMac2RevisionStringUUID
{
    return [CBUUID UUIDWithString:@"2A23"];
}


- (UARTPeripheral *) initWithPeripheral:(CBPeripheral*)peripheral delegate:(id<UARTPeripheralDelegate>) delegate
{
    if (self = [super init])
    {
        _peripheral = peripheral;
        _peripheral.delegate = self;
        _delegate = delegate;
    }
    return self;
}

- (void) didConnect{
    [_peripheral discoverServices:@[self.class.uartServiceUUID, self.class.deviceInformationServiceUUID,self.class.getMa1RevisionStringUUID]];
    NSLog(@"Did start service discovery.    -----------------  %@",self.class.getMac2RevisionStringUUID);
}

- (void) didDisconnect{
    
}

- (void) writeString:(NSString *) string{
    NSData *data = [NSData dataWithBytes:string.UTF8String length:string.length];
    
    if ((self.txCharacteristic.properties & CBCharacteristicPropertyWriteWithoutResponse) != 0)
    {
        [self.peripheral writeValue:data forCharacteristic:self.txCharacteristic type:CBCharacteristicWriteWithoutResponse];
    }
    else if ((self.txCharacteristic.properties & CBCharacteristicPropertyWrite) != 0)
    {
        [self.peripheral writeValue:data forCharacteristic:self.txCharacteristic type:CBCharacteristicWriteWithResponse];
    }
    else
    {
        NSLog(@"No write property on TX characteristic, %d. -------", self.txCharacteristic.properties,self.txCharacteristic);
    }
}

- (void) writeRawData:(NSData *) data{
    if ((self.txCharacteristic.properties & CBCharacteristicPropertyWriteWithoutResponse) != 0)
    {
        [self.peripheral writeValue:data forCharacteristic:self.txCharacteristic type:CBCharacteristicWriteWithoutResponse];
    }
    else if ((self.txCharacteristic.properties & CBCharacteristicPropertyWrite) != 0)
    {
        [self.peripheral writeValue:data forCharacteristic:self.txCharacteristic type:CBCharacteristicWriteWithResponse];
    }
    else
    {
        NSLog(@"No write property on TX characteristic, %d. -------", self.txCharacteristic.properties,self.txCharacteristic);
    }
    
}

- (void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    if (error){
        NSLog(@"Error discovering services: %@", error);
        return;
    }
    
    for (CBService *s in [peripheral services]){
        if ([s.UUID isEqual:self.class.uartServiceUUID]){
            NSLog(@"Found correct service");
            self.uartService = s;
            
            [self.peripheral discoverCharacteristics:@[self.class.txCharacteristicUUID, self.class.rxCharacteristicUUID,self.class.getMac2RevisionStringUUID] forService:self.uartService];
        }
        else if ([s.UUID isEqual:self.class.deviceInformationServiceUUID]){
    
            [self.peripheral discoverCharacteristics:@[self.class.hardwareRevisionStringUUID,self.class.getMac2RevisionStringUUID] forService:s];
        }
    }
}

- (void) peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    if (error){
        NSLog(@"Error discovering characteristics: %@", error);
        return;
    }
    
    for (CBCharacteristic *c in [service characteristics]){
        if ([c.UUID isEqual:self.class.rxCharacteristicUUID]){
            NSLog(@"Found RX characteristic");
            self.rxCharacteristic = c;
            
            [self.peripheral setNotifyValue:YES forCharacteristic:self.rxCharacteristic];
        }else if ([c.UUID isEqual:self.class.txCharacteristicUUID]){
            NSLog(@"Found TX characteristic");
            self.txCharacteristic = c;
        }else if ([c.UUID isEqual:self.class.hardwareRevisionStringUUID]){
            NSLog(@"Found Hardware Revision String characteristic");
            [self.peripheral readValueForCharacteristic:c];
        }
        
    }
}

- (void) peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if (error){
        NSLog(@"Error receiving notification for characteristic %@: %@", characteristic, error);
        return;
    }

    NSString *str = [[NSString alloc] initWithData:characteristic.value encoding:NSUTF8StringEncoding];
    
    NSString *value = [NSString stringWithFormat:@"%@",characteristic.value];
    NSMutableString *macString = [[NSMutableString alloc] init];
    [macString appendString:[[value substringWithRange:NSMakeRange(16, 2)] uppercaseString]];
    [macString appendString:@":"];
    [macString appendString:[[value substringWithRange:NSMakeRange(14, 2)] uppercaseString]];
    [macString appendString:@":"];
    [macString appendString:[[value substringWithRange:NSMakeRange(12, 2)] uppercaseString]];
    [macString appendString:@":"];
    [macString appendString:[[value substringWithRange:NSMakeRange(5, 2)] uppercaseString]];
    [macString appendString:@":"];
    [macString appendString:[[value substringWithRange:NSMakeRange(3, 2)] uppercaseString]];
    [macString appendString:@":"];
    [macString appendString:[[value substringWithRange:NSMakeRange(1, 2)] uppercaseString]];
    
    
//    NSLog(@"蓝牙地址   -------------------  %@ -------- %@",macString,str);
    
    [self delegateNubmerData:characteristic.value block:^(UInt16 dataBytes, NSInteger type) {
//        NSLog(@"协议 %ld    %x",(long)type,dataBytes);
        [self.delegate didReutunDataByte:dataBytes type:type];
    }];
    
//    [self.delegate didReadHardwareRevisionString:[hwRevision substringToIndex:hwRevision.length-2]];
}


- (void)delegateNubmerData:(NSData *)data block:(void(^)(UInt16 dataBytes,NSInteger type))block{
    const uint8_t *bytes = data.bytes;
    Byte thenByte[2];//协议2 设备返沪随机数用于加密
    Byte frameHeaderByte[2]; //帧头判断
    Byte order = '\0';
    for (int i = 0; i < data.length; i++)
    {
        if (i == 4 || i == 5) {
            
            thenByte[i - 4] = bytes[i];
        }else if (i < 2){
            frameHeaderByte[i] = bytes[i];
        }else if (i == 3){
            order = bytes[i];
        }
    }
    
//    NSLog(@"返回数据------%@",data);
    
    UInt16 frameHeader1 = frameHeaderByte[0] * 256;
    UInt16 frameHeader2 = frameHeader1 + frameHeaderByte[1];
    
    UInt16 then1 = thenByte[0] * 256;
    UInt16 then2 = then1 + thenByte[1];
    
    if (frameHeader2 == 0xcc76) {
        if (block) {
            if (order == 0x01) {
                block(then2,1);
            }else if (order == 0x02){
                block(then2,2);
            }else if (order == 0x03){
                block(then2,3);
            }else if (order == 0x04){
                block(then2,4);
            }
        }
    }else{
        if (block) {
            block(then2,0);
        }
    }
}

@end
