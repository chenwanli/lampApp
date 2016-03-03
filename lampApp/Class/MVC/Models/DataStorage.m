//
//  DataStorage.m
//  lampApp
//
//  Created by 陈万里 on 15/11/23.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "DataStorage.h"

@implementation DataStorage
#define PERIPHERALNAME @"peripheralName"
#define NICKNAME @"nickname"
#define DA @"userDataArray"

//定义了一套编码的规范
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.peripheralName forKey:PERIPHERALNAME];
    [aCoder encodeObject:self.nickname forKey:NICKNAME];
}

//初始化方法    定义了一套解码的规范
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.peripheralName = [aDecoder decodeObjectForKey:PERIPHERALNAME];
        self.nickname = [aDecoder decodeObjectForKey:NICKNAME];
    }
    return self;
    
}

+ (instancetype)sharedManager{
    static DataStorage *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
        
        
        
        [sharedAccountManagerInstance getuserData];
    });
    return sharedAccountManagerInstance;
}

- (void)getuserData{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/userData.plist"];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]){
        NSMutableData *data = [[NSMutableData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        self.userDataArray = [unarchiver decodeObject];
    }else{
        self.userDataArray = [NSMutableArray array];
    }
    
    NSLog(@"－－－－－%@",self.userDataArray);
}

- (void)saveUserData{
    NSLog(@"数据保存 －－－－－%@",self.userDataArray);
    
    NSMutableData *data = [[NSMutableData alloc]initWithCapacity:0];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self.userDataArray];
    [archiver finishEncoding];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/userData.plist"];
    [data writeToFile:path atomically:YES];

}

/*
 
 
 
 

 NSLog(@"取");

 
 */
@end
