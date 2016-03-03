
//
//  DelayTaskData.m
//  lampApp
//
//  Created by CaiKetao on 15/12/2.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "DelayTaskData.h"

@implementation DelayTaskData
#define DATE @"date"
#define DELAYDETE @"delayDete"
#define BEFOREANDFTER @"beforeAndAfter"
#define ISOPEN @"isOpen"
#define DELAYDETESHOW @"delayDeteShow"
#define TIMEDELAY @"timeDelay"



//定义了一套编码的规范
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.date forKey:DATE];
    [aCoder encodeObject:self.delayDete forKey:DELAYDETE];
    [aCoder encodeObject:self.beforeAndAfter forKey:BEFOREANDFTER];
    [aCoder encodeObject:self.isOpen forKey:ISOPEN];
    [aCoder encodeObject:self.delayDeteShow forKey:DELAYDETESHOW];
    [aCoder encodeObject:self.timeDelay forKey:TIMEDELAY];
}

//初始化方法    定义了一套解码的规范
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.date = [aDecoder decodeObjectForKey:DATE];
        self.delayDete = [aDecoder decodeObjectForKey:DELAYDETE];
        self.beforeAndAfter = [aDecoder decodeObjectForKey:BEFOREANDFTER];
        self.isOpen = [aDecoder decodeObjectForKey:ISOPEN];
        self.delayDeteShow = [aDecoder decodeObjectForKey:DELAYDETESHOW];
        self.timeDelay = [aDecoder decodeObjectForKey:TIMEDELAY];
    }
    return self;
    
}

+ (instancetype)sharedManager{
    static DelayTaskData *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];

    });
    return sharedAccountManagerInstance;
}

- (void)getuserDataPathStr:(NSString *)pathStr{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.plist",pathStr]];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]){
        NSMutableData *data = [[NSMutableData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        self.userDataArray = [unarchiver decodeObject];
    }else{
        self.userDataArray = [NSMutableArray array];
    }
    NSLog(@"获取数据－－－－－%@  －－－－－－ %@",self.userDataArray,path);
}

- (void)saveUserDataPathStr:(NSString *)pathStr{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.plist",pathStr]];
    NSLog(@"数据保存 －－－－－%@  －－－－－－ %@",self.userDataArray,path);
    
    NSMutableData *data = [[NSMutableData alloc]initWithCapacity:0];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self.userDataArray];
    [archiver finishEncoding];
    
    [data writeToFile:path atomically:YES];
    
    
}

@end
