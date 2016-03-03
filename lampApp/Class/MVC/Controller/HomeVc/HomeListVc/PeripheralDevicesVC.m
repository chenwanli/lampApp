//
//  PeripheralDevicesVC.m
//  lampApp
//
//  Created by CaiKetao on 15/11/21.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "PeripheralDevicesVC.h"
#import "PeripheralDevicesCell.h"
@interface PeripheralDevicesVC ()<peripheralDevicesCellDelegate>

@end

@implementation PeripheralDevicesVC

- (void)dealloc{
    NSLog(@"移除");
    
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"停止搜索");
    [self.cm stopScan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_A(39, 40, 43, 1);
    
    self.cm = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
    self.dataArray = [NSMutableArray array];
    
    UIView *navView = [self setNavigationBarOrSo:@"添加设备" leftImg:@"barbuttonicon_back" rightImg:@""];

    UIActivityIndicatorView *ai=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    ai.frame = CGRectMake(kDeviceWidth - 25, 40, 1, 1);
    [ai startAnimating];
    [navView addSubview:ai];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self performSelector:@selector(bluetooth) withObject:nil afterDelay:1];
    
    

    _equipmentListLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    _equipmentListLabel.text = @"正在搜寻,请耐心等待\n请确认操作设备处于开启状态";
    _equipmentListLabel.textAlignment = 1;
    _equipmentListLabel.textColor = [UIColor grayColor];
    _equipmentListLabel.numberOfLines = 0;
    [self.view addSubview:_equipmentListLabel];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArray.count > 0) {
        _equipmentListLabel.hidden = YES;
    }else{
        _equipmentListLabel.hidden = NO;
    }
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PeripheralDevicesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[PeripheralDevicesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.delegate = self;
        _equipmentListLabel.hidden = YES;
    }
    cell.peripheral = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark - 添加
- (void)PeripheralDevicesCellDelegateCell:(UITableViewCell *)cell{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    CBPeripheral *peripheralCell = self.dataArray[indexPath.row];
    for (DataStorage *dataStorage in [DataStorage sharedManager].userDataArray) {
        if ([dataStorage.peripheralName isEqualToString:peripheralCell.name]) {
            [CWLAlert alertTitle:nil message:@"该设备已添加" titleBtn:nil otherBtn:@"确定" VC:self];
            return ;
        }
    }
    
    DataStorage *dataMode = [[DataStorage alloc]init];
    CBPeripheral *peripheral =  _dataArray[indexPath.row];
    dataMode.nickname = peripheral.name;
    dataMode.peripheralName = peripheral.name;
    [[DataStorage sharedManager].userDataArray addObject:dataMode];
    
    [self.dategate peripheralDevicesVCDelegate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)bluetooth{
    NSLog(@"搜索");
    
    [self.cm scanForPeripheralsWithServices:@[UARTPeripheral.uartServiceUUID] options:@{CBCentralManagerScanOptionAllowDuplicatesKey: [NSNumber numberWithBool:NO]}];
}



- (void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@" 检测到设备  Did discover peripheral %@   data %@", peripheral,RSSI);
    
    NSString *substring = [peripheral.name substringToIndex:3];
    
    BOOL isAre = NO;
    if ([substring isEqualToString:@"WuJ"]) {
        for (CBPeripheral *pel in _dataArray) {
            if ([pel.name isEqualToString:peripheral.name]) {
                isAre = YES;
            }
        }
    }
    
//    BOOL isAreDataStorage = NO;
//    if (!isAre) {
//        for (DataStorage *dataStorage in [DataStorage sharedManager].userDataArray) {
//            if ([dataStorage.peripheralName isEqualToString:peripheral.name]) {
//                isAreDataStorage = YES;
//            }
//        }
//    }
    
    if (!isAre) {
        if ([substring isEqualToString:@"WuJ"]) {
            [self.dataArray addObject:peripheral];
            [self.tableView reloadData];
        }
    }
  
}

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn)
    {
        NSLog(@"异常");
  
    }
}

- (void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"Did connect peripheral %@", peripheral.name);
    
}

- (void) centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"Did disconnect peripheral %@", peripheral.name);
}




- (void)navBtn:(UIButton *)sender{
    if(sender.tag == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        
    }
}


@end
