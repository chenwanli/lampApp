//  主页
//  HomeVc.h
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeripheralDevicesVC.h"
@interface HomeVc : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,peripheralDevicesVCDelegate,cwlAlertViewDelegate>{
    BOOL _editor;
    NSInteger _delRow;
    
    UILabel *_equipmentListLabel;
}

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
