//
//  DataObject.h
//  蓝牙通讯
//
//  Created by 陈万里 on 15/10/24.
//  Copyright © 2015年 chenwanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NetworkExtension/NetworkExtension.h>
@interface DataObject : NSObject
+ (Byte)cwlByte:(NSInteger)byt;

#pragma mark - 协议1
- (NSData *)agreementA;
- (NSData *)protocolErData:(UInt16)keyData operationData:(Byte *)operationData pwsByte:(Byte *)pwsByte;
@end
