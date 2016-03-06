//  操作界面
//  OperationVC.h
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyNameVC.h"
#import "DelayListVC.h"
#import "SlidingView.h"
@interface OperationVC : UIViewController<swatchesDelegate,CBCentralManagerDelegate,UIAlertViewDelegate,UARTPeripheralDelegate,DelayListVCDelegate>{
    BOOL _timeout;
    
    UIImage *_swatchesImg;
    DataObject *_dataObject;
    
    UInt16 _dataRandom;//随机数
    Byte _pwsByte[2];//密码
    Byte _operationData[8];//数据
    
    
    MBProgressHUD *_hud;
    BOOL _isOperation[2];//用于判断延时定时是否开启
    
//    颜色按钮
    UIButton *_colorBtn;
    UIButton *_typeBtn;
//    开关按钮
    UIButton *_downBtn;
}
@property(nonatomic,strong)DataStorage *dataStorage;
@property UARTPeripheral *currentPeripheral;
@property CBCentralManager *cm;


@end
