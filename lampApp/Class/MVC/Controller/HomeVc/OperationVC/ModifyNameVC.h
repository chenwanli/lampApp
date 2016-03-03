//
//  ModifyNameVC.h
//  lampApp
//
//  Created by CaiKetao on 15/11/28.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifyNameVC : UIViewController<cwlAlertViewDelegate>{
    UITextField *_nameField;
}
@property(nonatomic,strong)DataStorage *dataStorage;
@end
