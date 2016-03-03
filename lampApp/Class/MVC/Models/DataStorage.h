//
//  DataStorage.h
//  lampApp
//
//  Created by 陈万里 on 15/11/23.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject
+ (instancetype)sharedManager;
@property(nonatomic,strong)NSMutableArray *userDataArray;

@property(nonatomic,copy)NSString *peripheralName;
@property(nonatomic,copy)NSString *nickname;
- (void)saveUserData;


@end
