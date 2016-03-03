//  操作界面
//  OperationVC.m
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "OperationVC.h"

@interface OperationVC ()

@end

@implementation OperationVC

- (Byte)strEndMinute:(NSString *)endMinute{
    endMinute = [NSString stringWithFormat:@"0x%@",endMinute];
    unsigned long red = strtoul([endMinute UTF8String],0,0);
    Byte endMinuteByte = (Byte)red;
    return endMinuteByte;
    //    http://www.cnblogs.com/yangmx/p/3805724.html
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarOrSo:@"智能插座" leftImg:@"barbuttonicon_back" rightImg:@"barbuttonicon_set"];
    self.view.backgroundColor = RGB_A(39, 40, 43, 1);
    
    for (int i = 0; i < 2; i++) {
        _isOperation[i] = YES;
    }

    _dataObject = [[DataObject alloc]init];
    _pwsByte[0] = [self strEndMinute:[_dataStorage.peripheralName substringWithRange:NSMakeRange(5,2)]];
    _pwsByte[1] = [self strEndMinute:[_dataStorage.peripheralName substringWithRange:NSMakeRange(7,2)]];
    
    _operationData[6] = 0x00;//定时
    _operationData[7] = 0x00;//延时
    
    self.cm = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    [self performSelector:@selector(bluetooth) withObject:nil afterDelay:0.5];
    
    [self uiCreate];
}

- (void)uiCreate{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64 - 70)];
    scrollView.contentSize = CGSizeMake(0, 300);
    [self.view addSubview:scrollView];
    
    SwatchesImg *swatchesImg = [[SwatchesImg alloc]initWithFrame:CGRectMake(80, 40, kDeviceWidth - 160, kDeviceWidth - 160)];
    swatchesImg.delegate = self;
    [scrollView addSubview:swatchesImg];
    
    
    float typeWidth = (kDeviceWidth - 55) / 4;
    UIButton *colorBtn = nil;
    for (int i = 0; i < 4; i++) {
        colorBtn = [UIButton cwlBtnType:UIButtonTypeCustom rect:CGRectMake( 20 + i * (typeWidth + 5), swatchesImg.totalHeigth + 50, typeWidth,typeWidth) radius:typeWidth / 2 title:nil titleColor:nil view:self.view];
        [colorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [colorBtn setImage:[UIImage imageNamed:@[@"红",@"绿",@"蓝",@"白"][i]] forState:UIControlStateNormal];
        colorBtn.tag = i + 4;
        [colorBtn addTarget:self action:@selector(colorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:colorBtn];
    }
    
    typeWidth = (kDeviceWidth - 40) / 5;
    for (int i = 0; i < 5; i++) {
        UIButton *typeBtn = [UIButton cwlBtnType:UIButtonTypeCustom rect:CGRectMake(10 + i * (typeWidth + 5), colorBtn.totalHeigth + 10, typeWidth,typeWidth) radius:typeWidth / 2 title:nil titleColor:[UIColor whiteColor] view:scrollView];
//        [typeBtn setImage:[UIImage imageNamed:@[@"渐变",@"闪耀",@"任性闪耀",@"任性渐变",@"彩虹"][i]] forState:UIControlStateNormal];
        typeBtn.backgroundColor = [UIColor yellowColor];
        typeBtn.tag = i;
        [typeBtn addTarget:self action:@selector(colorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:typeBtn];
        
    }
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 30)];
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = RGB_A(137, 138, 142, 1);
    lable.textAlignment = 1;
    lable.text = @"Brightne";
    [scrollView addSubview:lable];
    
    //    进度条
//    CWLSlider *brightneSlider = [[CWLSlider alloc]initWithFrame:CGRectMake(-95, colorBtn.totalHeigth - 5, 180, 30) color:[UIColor redColor] title:@"BRIGHTNE"];
//    [scrollView addSubview:brightneSlider];
//    brightneSlider.block = ^(Byte brightneSliderByte){
//        _operationData[0] = 0x00;
//        _operationData[1] = 0x00;
//        _operationData[2] = 0x00;
//        _operationData[3] = brightneSliderByte; //白
//        [self dataWrite];
//    };
    
    UILabel *speedLable = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth - 60, 20, 50, 30)];
    speedLable.font = [UIFont systemFontOfSize:13];
    speedLable.textAlignment = 1;
    speedLable.text = @"Speed";
    speedLable.textColor = RGB_A(137, 138, 142, 1);
    [scrollView addSubview:speedLable];

//    CWLSlider *speedSlider= [[CWLSlider alloc]initWithFrame:CGRectMake(kDeviceWidth - 45 -90, colorBtn.totalHeigth - 5, 180, 30) color:[UIColor blueColor] title:@"SPEED"];
//    [scrollView addSubview:speedSlider];
//    speedSlider.block = ^(Byte speedSliderByte){
//        _operationData[4] = speedSliderByte;
//        [self dataWrite];
//    };
    
    for (int i = 0; i < 2; i++) {
        UIButton *barBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        barBtn.frame = CGRectMake(i * kDeviceWidth / 2, kDeviceHeight - 60, kDeviceWidth / 2, 60);
        [barBtn setTitle:@[@"定时任务",@"延时任务"][i] forState:UIControlStateNormal];
        [barBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        barBtn.backgroundColor = RGB_A(0, 0, 0, 0.3);
        barBtn.tag = i;
        [barBtn addTarget:self action:@selector(barBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:barBtn];
        
    }
}

- (void)barBtn:(UIButton *)sender{
    DelayListVC *delayListVC = [[DelayListVC alloc]init];
    delayListVC.type = sender.tag;
    delayListVC.dataStorage = self.dataStorage;
    delayListVC.delegate = self;
    delayListVC.isOpen = _isOperation[sender.tag];
    [self.navigationController pushViewController:delayListVC animated:YES];
}
/*
 命令设置回调
 timeDelay 
 0.定时
 1.延时
 
 @"渐变后关闭";
 @"渐变后开启";
 @"后关闭";
 @"后开启";
 */
- (void)delayListVCDelegate:(DelayTaskData *)delayTaskData type:(NSInteger)type{
    
    UInt8 brakdata[4];
    UInt8 jlkj[1];
    bdAddrLow2Str([delayTaskData.delayDeteShow intValue], brakdata, jlkj);
    
    UInt8 delayOnBtye1 = (Byte)(brakdata[3] << 4);
    UInt8 delayOnBtye2 = delayOnBtye1 + brakdata[2];
    
    UInt8 delayAfterBtye1 = (Byte)(brakdata[1] << 4);
    UInt8 delayAfterBtye2 = delayAfterBtye1 + brakdata[0];
    
    _operationData[6] = delayOnBtye2;
    _operationData[7] = delayAfterBtye2;
    
    if (![delayTaskData.timeDelay boolValue]) {
        if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后关闭"]) {
            _operationData[5] = 0x05;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后开启"]){
            _operationData[5] = 0x06;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"后关闭"]){
            _operationData[5] = 0x07;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"后开启"]){
            _operationData[5] = 0x08;
        }
    }else{
        if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后关闭"]) {
            _operationData[5] = 0x5;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后关闭"]){
            _operationData[5] = 0x6;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后关闭"]){
            _operationData[5] = 0x7;
        }else if ([delayTaskData.beforeAndAfter isEqualToString:@"渐变后关闭"]){
            _operationData[5] = 0x8;
        }
    }
    
    for (int i = 0; i < 2; i++) {
        if (i == type) {
            _isOperation[i] = NO;
        }else{
            _isOperation[i] = YES;
        }
    }
    
    
    NSData *data = [_dataObject protocolErData:_dataRandom operationData:_operationData pwsByte:_pwsByte];
    [self.currentPeripheral writeRawData:data];
}

void bdAddrLow2Str(int data,UInt8 *brakdata, UInt8 *datalong)
{
    int i,j,l;
    i = data / 16;
    if( i ){
        brakdata[0] = data % 16;
        j = i / 16;
        if( j ){
            brakdata[1] = i % 16;
            l = j / 16;
            if( l ){
                brakdata[2] = j % 16;
                datalong[0] = 4;
                brakdata[3] = l % 16;
            }
            else{
                datalong[0] = 3;
                brakdata[2] = j % 16;
            }
        }
        else{
            datalong[0] = 2;
            brakdata[1] = i % 16;
        }
    }
    else{
        datalong[0] = 1;
        brakdata[0] = data % 16;
    }
}

#pragma mark - 开始链接
- (void)bluetooth{
    [self.cm scanForPeripheralsWithServices:@[UARTPeripheral.uartServiceUUID] options:@{CBCentralManagerScanOptionAllowDuplicatesKey: [NSNumber numberWithBool:NO]}];
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"正在链接...";
    [self performSelector:@selector(timeout) withObject:nil afterDelay:5];
}

- (void)timeout{
    if (!_timeout) {
        [_hud hide:YES];
        [CWLAlert alertTitle:nil message:@"链接超时" titleBtn:nil otherBtn:@"确定" VC:self];
    }
}
/*
 0.闪耀
 1.渐变
 2.任性闪耀
 3.任性渐变
 4.红色
 5.绿色
 6.蓝色
 7.白色
 */
- (void)colorBtnClick:(UIButton *)sender{
    if(sender.tag < 4){
        _operationData[5] = [DataObject cwlByte:sender.tag];
    }else{
        _operationData[0] = 0x00;
        _operationData[1] = 0x00;
        _operationData[2] = 0x00;
        _operationData[3] = 0x00;
        _operationData[5] = 0x00;
        
        _operationData[sender.tag - 4] = 0xff;
    }
    [self dataWrite];
    
}


#pragma mark - 颜色协议
- (void)swatchesDelegateByte:(Byte *)byte{
    _operationData[0] = byte[0];
    _operationData[1] = byte[1];
    _operationData[2] = byte[2];
    [self dataWrite];
}

#pragma mark - 数据发送
- (void)dataWrite{
    NSData *data = [_dataObject protocolErData:_dataRandom operationData:_operationData pwsByte:_pwsByte];
    [self.currentPeripheral writeRawData:data];
    for (int i = 0; i < 2; i++) {
        _isOperation[i] = YES;
    }
}
//operationData[0];//数据1    红
//operationData[1];//数据2    绿
//operationData[2];//数据3    蓝

//operationData[3];//数据4    白
//operationData[4];//数据5    速度
//operationData[5];//数据6    模式
//operationData[6];//数据7    定时
//operationData[7];//数据8    定时

- (void) didReutunDataByte:(UInt16)dataRandom type:(NSInteger)type{
    if (type == 0) {
        NSLog(@"协议一 %x",dataRandom);
        NSData *data = [_dataObject agreementA];
        [self.currentPeripheral writeRawData:data];
    }
    if (type == 2) {
        NSLog(@"协议二 可以进行操作了");
        _dataRandom = dataRandom;
        [_hud hide:YES];
        [CWLAlert alertTitle:nil message:@"链接成功" titleBtn:nil otherBtn:@"确定" VC:self];return;
    }
}





- (void) didReceiveData:(NSString *) string{
    NSLog(@"接收协议2---------%@ ",string);
}

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn)
    {
        
    }
}


- (void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@" 检测到设备  Did discover peripheral %@  \n  %@", peripheral.name,_dataStorage.peripheralName);
    
    if([_dataStorage.peripheralName isEqualToString:peripheral.name]){
        self.currentPeripheral = [[UARTPeripheral alloc] initWithPeripheral:peripheral delegate:self];
        [self.cm connectPeripheral:peripheral options:@{CBConnectPeripheralOptionNotifyOnDisconnectionKey: [NSNumber numberWithBool:YES]}];
        //        peripheral.delegate = self;
        [self.cm stopScan];
    }
}


- (void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"Did connect peripheral %@", peripheral.name);
    if ([self.currentPeripheral.peripheral isEqual:peripheral])
    {
        [self.currentPeripheral didConnect];
        _timeout = YES;
        
        [peripheral discoverServices:@[[CBUUID UUIDWithString:@"180A"]]];
    }
}


- (void) centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"Did disconnect peripheral %@", peripheral.name);
    if ([self.currentPeripheral.peripheral isEqual:peripheral])
    {
        [_hud hide:YES];
        [CWLAlert alertTitle:nil message:@"链接失败" titleBtn:nil otherBtn:@"确定" VC:self];
        [self.currentPeripheral didDisconnect];
    }
}


- (void)navBtn:(UIButton *)sender{
    if(sender.tag == 0){
        self.currentPeripheral = nil;
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        ModifyNameVC *modifyNameVC = [[ModifyNameVC alloc]init];
        modifyNameVC.dataStorage = _dataStorage;
        [self.navigationController pushViewController:modifyNameVC animated:YES];
    }
}


- (void)dealloc{
    NSLog(@"视图移除");
    [self.currentPeripheral didDisconnect];
}
@end